# Personal AI Infrastructure — Day 1 Setup Plan

This document outlines exactly what to do **today** to fully install and activate the Personal AI Infrastructure (PAI) system on macOS using **free Claude Desktop**. No APIs or paid services required.

## 1. Install Claude Desktop

Download and install from:
https://claude.ai/download

Log in with your Anthropic account. This gives you:

- Claude Desktop
- Claude Code
- Local file reading
- Full support for `~/.claude` skills + context system

## 2. Clone the Personal AI Infrastructure Repo

```bash
cd ~/Workspace
git clone https://github.com/danielmiessler/Personal_AI_Infrastructure.git pai
cd pai
```

## 3. Install the PAI `.claude` Directory

Copy the provided `.claude` folder into your home directory:

```bash
mkdir -p ~/.claude
cp -R .claude/* ~/.claude/
```

Verify:

```bash
ls ~/.claude
```

You should see:

```
agents
commands
context
hooks
settings.json
skills
voice-server
.mcp.json
```

## 4. Customize the PAI Skill

Open the core skill file:

```bash
code ~/.claude/skills/PAI/SKILL.md
```

Edit:

- Your name  
- Your roles  
- Technical domains  
- Tools you use  
- Goals for your AI system  

Save the file.

## 5. Create Your First Project Context

Example: Lookinglass Cyber LLC.

```bash
mkdir -p ~/.claude/context/projects/lookinglass
code ~/.claude/context/projects/lookinglass/CLAUDE.md
```

Paste:

```markdown
# Lookinglass Cyber LLC

This project defines how you help me run and grow my cybersecurity & AI consulting business.

## Focus
- Security + MSP-style support for SMBs
- Intune engineering and automation
- AI-assisted consulting
- Homelab + cloud architecture

## Responsibilities for Claude
- Maintain up-to-date business plans
- Track opportunities and proposals
- Help prepare SOWs and service catalogs
- Suggest next actions when I ask business questions

## Notes
- My identity and preferences are defined in the PAI skill.
- This project should load when I discuss business tasks.
```

## 6. Create a “Working Memory” Task for Today

```bash
mkdir -p ~/.claude/context/working/active/pai-setup
code ~/.claude/context/working/active/pai-setup/CLAUDE.md
```

Paste:

```markdown
# Task: Set Up My Personal AI Infrastructure

## Today's Goal
- Install PAI
- Customize PAI skill
- Create first project context
- Validate PAI works inside Claude Code

## How Claude Should Behave
- Act as my AI systems architect
- Provide simple, actionable steps
- Reference project and skill files
- Keep tasks lightweight and clear

## Related Contexts
- ~/.claude/skills/PAI/SKILL.md
- ~/.claude/context/projects/lookinglass/CLAUDE.md
```

## 7. Launch Claude Desktop and Activate PAI

1. Open Claude Desktop.  
2. Open `~/.claude` in Claude Code:  
   **File → Open Folder → ~/.claude**  
3. In a new chat tab, tell Claude:

```
Load my PAI skill at ~/.claude/skills/PAI/SKILL.md
Use my active task at ~/.claude/context/working/active/pai-setup/CLAUDE.md
Also load the Lookinglass project context.
After reading everything, tell me my next three steps.
```

This activates the PAI system.

## 8. Done for Today

After completing these steps you will have:

- A working PAI installation  
- Personalized skill behavior  
- Your first project brain  
- A working memory task  
- Free Claude acting as your personal OS  

Fabric, local LLMs, and advanced hooks can be added later.

