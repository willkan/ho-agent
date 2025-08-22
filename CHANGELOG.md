# Changelog

## [1.3.0] - 2025-08-21

### Fixed
- **CRITICAL**: Fixed Task tool nested call issue that caused workflow to hang
- Coordinator is now an instruction document, not a subagent
- Main Claude acts as orchestrator, delegates via Task tool
- Prevents infinite waiting from nested Task calls

### Changed
- Coordinator.md marked as "GUIDANCE DOCUMENT - Not a subagent"
- Workflow uses hybrid approach: main Claude orchestrates, specialists are subagents
- Updated documentation to reflect correct Task tool usage

## [1.2.0] - 2025-08-21

### Changed
- **MAJOR**: Coordinator now automatically delegates to agents instead of waiting for manual commands
- Workflow progresses automatically through all 8 stages
- Coordinator orchestrates but never codes directly
- Auto-delegation pattern: Coordinator → Agent → Work → Next Stage

### Added
- Stage progress visualization in coordinator
- Automatic role delegation flow
- Optional manual control commands (*pause, *skip)

## [1.1.0] - 2025-08-21

### Added
- Command-based workflow system with `*` prefix commands
- Auto-activation protocol for coordinator agent
- Clear role-switching mechanism inspired by BMAD-METHOD
- Example workflow execution in generated CLAUDE.md

### Changed
- Coordinator agent now has explicit activation protocol and command system
- README clarifies this is a methodology framework, not a technical multi-agent system
- setup-workflow.sh generates clearer CLAUDE.md with activation instructions
- Agent definitions updated with Linus Torvalds personality traits

### Fixed
- Coordinator no longer writes code directly (follows "coordinator who codes is failed coordinator" principle)
- Workflow activation now properly guides Claude Code to read coordinator.md first
- Role switching is now explicit with clear announcements

## [1.0.0] - Initial Release

### Added
- 11 specialized agent role definitions
- 8-stage progressive development workflow
- Storyline-driven development methodology
- Setup script for easy installation in projects
- Quality validation framework
- Human intervention checkpoints