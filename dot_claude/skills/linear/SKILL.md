---
name: linear
description: Start working on a Linear issue. Fetches issue details, enters plan mode, sets up git branch workflow, and after implementation opens the PR and runs the Copilot review loop.
argument-hint: <issue-id>
---

# Linear Issue Workflow

You are starting a task based on a Linear issue. **DO NOT start working immediately.** Follow this exact workflow:

## Step 1: Fetch the Linear Issue

Use the Linear MCP `get_issue` tool to fetch the issue details for: **$ARGUMENTS**

If no issue ID was provided, ask the user for it. Issue IDs look like `PLD-1234` or similar.

## Step 2: Present Issue Summary

After fetching, present a clear summary to the user:

```
## Linear Issue: [ISSUE-ID]

**Title:** [title]
**Status:** [status]
**Priority:** [priority]
**Assignee:** [assignee]

### Description
[full description from the issue]

### Labels
[labels if any]
```

## Step 3: STOP AND WAIT FOR USER INPUT

**CRITICAL: Do not proceed further without explicit user confirmation.**

Ask the user:

> I've loaded the Linear issue. Before I create a plan:
>
> 1. **Additional context?** Are there any files, requirements, or constraints I should know about?
> 2. **Scope clarification?** Should I focus on any specific aspect of this issue?
> 3. **Technical preferences?** Any preferred approaches or patterns to follow?
>
> Please add any context now, or say "proceed" when ready to plan.

**Wait for the user's response before continuing.**

## Step 4: Sync Codebase Before Planning

**Before entering plan mode**, ensure you're analyzing up-to-date code:

```bash
git fetch upstream
git checkout master
git pull upstream master
```

This ensures the plan is based on the current state of the codebase.

## Step 5: Enter Plan Mode

After syncing, use the `EnterPlanMode` tool to begin planning.

**Your plan MUST include these sections in order:**

### Plan Structure

1. **Summary** - What the Linear issue requires

2. **Analysis** - Files to modify, dependencies, impacts

3. **Implementation Steps** - Numbered steps for the actual code changes

4. **Testing Approach** - How to verify the implementation

5. **Git Workflow** - Include this exact section in every plan:
   ```
   ## Git Workflow

   1. Branch name: `{issue-id-lowercase}-{description}`
   2. Base: `upstream/master`
   3. Commits: [describe expected commits]
   4. PR target: `upstream/master`
   5. After implementation: open the PR with `pull-requests:create-pull-request`, then run the Copilot loop
   ```

6. **Open Questions** - Any assumptions or decisions needing user input

## Step 6: Enter Worktree (After Plan Approval)

**Only after the plan is approved**, create an isolated worktree for implementation.
This prevents branch conflicts with other concurrent Claude sessions.

Use the `EnterWorktree` tool to create a worktree. This automatically:
- Creates an isolated copy of the repository
- Creates a new branch based on the current HEAD
- Switches to the worktree directory

After entering the worktree, rename the auto-generated branch to follow naming rules:
```bash
git branch -m {branch-name}
```

### If a branch already exists (continuing previous work)

Check first:
```bash
git fetch upstream && git fetch origin
git branch -r --list "*/{branch-name}"
```

If the branch exists on origin, exit the worktree and check it out directly instead:
```bash
# Use ExitWorktree first, then:
git checkout -b {branch-name} origin/{branch-name}
```

### Confirm
```bash
git branch --show-current
pwd
```

## Step 7: Open the PR and Run the Copilot Loop (After Implementation)

When the implementation and its local tests are done, do not stop at "code written". Finish the delivery:

1. Invoke the `pull-requests:create-pull-request` skill. Pass it the Linear issue ID from Step 1, so it does not ask for one, and the branch from Step 6. It handles the pre-PR review, the draft PR, the CI watch and the Linear link. Make sure the PR is assigned to the user: `gh pr edit <n> --repo <upstream-owner>/<repo> --add-assignee @me` (skip if already assigned).
2. Once CI is green, run the Copilot loop (`pull-requests:address-copilot-review`, which `create-pull-request` hands off to). Run it by default, whatever the `copilotReview` preference in `~/.claude/pull-requests-plugin/config.json` says. Skip it only when the user said so explicitly, in the issue context, the plan or this session ("no Copilot", "skip the review loop").
3. If the loop ends on a 🟢 verdict (Approval recommended) or a 🔵 verdict (Needs a closer look), mark the PR ready for review with `gh pr ready <n> --repo <upstream-owner>/<repo>`. On 🔵 say in the report what Copilot wants a human to weigh.
4. If the loop stops without converging (round cap reached with Copilot still commenting, or CI stays red), leave the PR in draft. Report why and ask before spending more rounds. Never mark ready on a red branch.
5. End with the PR URL, the final Copilot verdict, the decision ledger the loop prints, and whether the PR is draft or ready.

When the user said to skip the Copilot loop, still do steps 1 and 5, and leave the PR in draft unless they asked for ready.

## Branch Naming Rules

- Always prefix with issue ID in **lowercase**
- Use hyphens only (no slashes, no underscores)
- Keep description short (2-4 words, kebab-case)
- Description should reflect the **plan's focus**, not just the issue title
- Examples:
  - `pld-1234-oauth2-login-flow`
  - `pld-5678-fix-null-pointer-validation`
  - `eng-42-refactor-api-client`

## AWS Access

If the analysis or implementation requires AWS CLI or API access:
- Use AWS SSO profile: `pp-des` (also the `[default]` profile)
- Example: `aws s3 ls --profile pp-des`
- For boto3: `session = boto3.Session(profile_name='pp-des')`

## Code Style

Be sparing with inline code comments. Add one only where the complexity genuinely
warrants it — a non-obvious algorithm, a workaround whose reason isn't visible from
the code, a constraint a reader would otherwise trip over.

- Match the comment density of the surrounding file; don't be the outlier
- Comment *why*, never *what* — the code already says what it does
- No comments restating the next line, no section-divider banners, no narrating the diff
- If a comment is needed to explain what the code does, prefer clearer naming or a
  smaller function instead

## Checklist

- [ ] Linear issue fetched and displayed
- [ ] User had opportunity to add context
- [ ] User explicitly said to proceed
- [ ] Codebase synced with upstream/master before planning
- [ ] Plan includes Git Workflow section
- [ ] Plan approved by user
- [ ] Worktree created (isolated from other sessions)
- [ ] Feature branch named correctly
- [ ] After implementation: PR opened through `create-pull-request`
- [ ] PR assigned to the user
- [ ] Copilot loop run (unless the user said to skip it)
- [ ] PR marked ready if the loop converged (🟢 or 🔵), otherwise left in draft with the reason reported

## Never Do These

- Never start coding without user confirmation
- Never skip the "wait for context" step
- Never analyze code without syncing to upstream/master first
- Never create a plan without the Git Workflow section
- Never create branch before plan is approved
- Never work directly on main/master — always use a worktree
- Never create a duplicate branch (always check first)
- Never use uppercase in branch names
- Never use slashes or underscores in branch names
- Never add inline comments the code complexity doesn't warrant
- Never end the task at "implementation done" without opening the PR (Step 7)
- Never skip the Copilot loop unless the user explicitly said to
- Never mark a PR ready while the loop has not converged or CI is red
