#!/usr/bin/env bash
# Saves the daily standup as a Slack draft reply. Pass --preview to print it instead.
# Runs headless, so every tool the skill needs is allowlisted. Slack is limited to
# reading and saving a draft, so this job cannot post.
set -euo pipefail

tools=(
  "Bash(gh search prs:*)" "Bash(gh auth status:*)" "Bash(gh api user:*)" "Read"
  "mcp__claude_ai_Slack__slack_read_channel"
  "mcp__claude_ai_Slack__slack_read_user_profile"
  "mcp__claude_ai_Slack__slack_send_message_draft"
  "mcp__claude_ai_Linear__list_issues"
  "mcp__claude_ai_Notion__notion-get-tool-access"
  "mcp__claude_ai_Notion__notion-get-users"
  "mcp__claude_ai_Notion__notion-search"
  "mcp__claude_ai_Notion__notion-ai-search"
  "mcp__claude_ai_Notion__notion-fetch"
  "mcp__claude_ai_Notion__notion-list-recent-pages"
  "mcp__claude_ai_Google_Calendar__list_events"
  "mcp__claude_ai_PagerDuty__browse_incidents"
)

cd "$HOME"
exec claude -p "/data-engineering-team:daily-standup $*" --allowedTools "$(IFS=,; echo "${tools[*]}")"
