---
name: linear
description: Start working on a Linear issue. Fetches issue details, enters plan mode, and sets up git branch workflow.
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
- Use AWS SSO profile: `pp` (platform-production)
- Example: `aws s3 ls --profile pp`
- For boto3: `session = boto3.Session(profile_name='pp')`

## Checklist

- [ ] Linear issue fetched and displayed
- [ ] User had opportunity to add context
- [ ] User explicitly said to proceed
- [ ] Codebase synced with upstream/master before planning
- [ ] Plan includes Git Workflow section
- [ ] Plan approved by user
- [ ] Worktree created (isolated from other sessions)
- [ ] Feature branch named correctly

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
