{{/*
Expand the name of the chart.
*/}}
{{- define "demo-crm.name" -}}
{{- .Chart.Name }}
{{- end }}

{{/*
Create a default fully qualified app name.
*/}}
{{- define "demo-crm.fullname" -}}
{{- if contains .Chart.Name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}

{{/*
Common labels applied to every resource.
*/}}
{{- define "demo-crm.labels" -}}
app.kubernetes.io/name: {{ include "demo-crm.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: demo-crm
{{- end }}

{{/*
Selector labels — used in matchLabels and pod labels.
Subset of common labels, must stay stable (never change after first deploy).
*/}}
{{- define "demo-crm.selectorLabels" -}}
app.kubernetes.io/name: {{ include "demo-crm.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}