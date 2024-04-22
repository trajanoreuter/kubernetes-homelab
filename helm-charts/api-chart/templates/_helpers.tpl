{{/*
Expand the name of the chart.
*/}}
{{- define "api-chart.name" -}}
{{- default .Values.application.name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "api-chart.fullname" -}}
{{- if .Values.fullapplicationName }}
{{- .Values.fullapplicationName | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.application.name }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "api-chart.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "api-chart.labels" -}}
helm.sh/chart: {{ include "api-chart.chart" . }}
{{ include "api-chart.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
chart-version: {{ .Chart.Version | quote }}
chart-kind: "api"
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "api-chart.selectorLabels" -}}
app.kubernetes.io/name: {{ include "api-chart.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
ServiceAccount name
*/}}
{{- define "api-chart.serviceAccountName" -}}
{{- printf "%s-%s" .Release.Name .Values.application.name | trunc 63 | trimSuffix "-"}}
{{- end }}
