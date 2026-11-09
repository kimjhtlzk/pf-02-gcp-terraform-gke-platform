# Record with: vhs docs/assets/demo.tape (run terraform init in the example first)
# No cloud credentials are needed, and a throwaway HOME keeps local details out of the recording.
Output docs/assets/demo.gif
Set Shell "bash"
Set FontFamily "Menlo"
Set FontSize 18
Set Width 1200
Set Height 620
Set Theme "Dracula"
Set Padding 24
Set TypingSpeed 35ms

Hide
Type "export PS1='$ '; clear"
Enter
Sleep 500ms
Show

Type "ls modules | wc -l"
Enter
Sleep 1500ms
Type "grep -E 'max_surge|max_unavailable' examples/gke-regional-cluster/main.tf"
Enter
Sleep 2s
Type "terraform -chdir=examples/gke-regional-cluster validate"
Enter
Sleep 9s
Type "checkov --config-file .checkov.yaml 2>/dev/null | grep 'Passed checks' | tail -1"
Enter
Wait+Screen@240s /Passed checks: [0-9]+/
Sleep 4s
