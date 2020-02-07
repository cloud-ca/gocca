## Changelog

{{ range .Versions }}
{{ if .CommitGroups -}}
{{ range .CommitGroups }}
### {{ .Title }}
{{ range .Commits -}}
{{ if and (not (contains .Subject "Merge pull request")) (not (contains .Subject "Merge branch")) -}}
- {{ if .Scope }}**{{ .Scope }}:** {{ end }}{{ if .Subject }}{{ .Subject }}{{ else }}{{ .Header }}{{ end }}
{{ end -}}
{{ end -}}
{{ end }}
{{ else }}
{{ range .Commits -}}
{{ if and (not (contains .Header "Merge pull request")) (not (contains .Header "Merge branch")) -}}
- {{ if .Scope }}**{{ .Scope }}:** {{ end }}{{ if .Subject }}{{ .Subject }}{{ else }}{{ .Header }}{{ end }}
{{ end -}}
{{ end }}
{{ end -}}

{{- if .NoteGroups -}}
{{ range .NoteGroups -}}
### {{ .Title }}
{{ range .Notes }}
{{ .Body }}
{{ end }}
{{ end -}}
{{ end -}}
{{ end -}}
