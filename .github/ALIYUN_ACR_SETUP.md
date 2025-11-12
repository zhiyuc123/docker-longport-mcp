# Aliyun Container Registry (ACR) Setup Guide

This document explains how to configure GitHub Actions secrets for the Aliyun ACR workflow.

## Required GitHub Secrets

To use the `aliyun-docker-image.yml` workflow, you need to configure the following secrets in your GitHub repository:

### 1. Navigate to Repository Settings
- Go to your repository on GitHub
- Click on **Settings** → **Secrets and variables** → **Actions**
- Click **New repository secret** for each of the following

### 2. Create the Following Secrets

| Secret Name | Description | Example Value |
|-------------|-------------|---------------|
| `ALIYUN_REGISTRY` | Aliyun Container Registry endpoint URL | `registry.cn-hangzhou.aliyuncs.com` |
| `ALIYUN_USERNAME` | Your Aliyun ACR username | Your Aliyun account username |
| `ALIYUN_PASSWORD` | Your Aliyun ACR password | Your Aliyun account password or access token |
| `ALIYUN_NAMESPACE` | The namespace/repository path in ACR | `your-namespace/longport-mcp` |

### 3. Aliyun Registry Endpoints

Choose the appropriate registry endpoint based on your region:

- **华北1（青岛）**: `registry.cn-qingdao.aliyuncs.com`
- **华北2（北京）**: `registry.cn-beijing.aliyuncs.com`
- **华北3（张家口）**: `registry.cn-zhangjiakou.aliyuncs.com`
- **华东1（杭州）**: `registry.cn-hangzhou.aliyuncs.com`
- **华东2（上海）**: `registry.cn-shanghai.aliyuncs.com`
- **华南1（深圳）**: `registry.cn-shenzhen.aliyuncs.com`
- **华南2（河源）**: `registry.cn-heyuan.aliyuncs.com`
- **西南1（成都）**: `registry.cn-chengdu.aliyuncs.com`
- **中国香港**: `registry.cn-hongkong.aliyuncs.com`
- **亚太东南1（新加坡）**: `registry.ap-southeast-1.aliyuncs.com`
- **美国西部1（硅谷）**: `registry.us-west-1.aliyuncs.com`
- **美国东部1（弗吉尼亚）**: `registry.us-east-1.aliyuncs.com`
- **欧洲中部1（法兰克福）**: `registry.eu-central-1.aliyuncs.com`

### 4. Setting Up Aliyun ACR Namespace

Before pushing images, you need to create a namespace in Aliyun ACR:

1. Log in to [Aliyun Container Registry Console](https://cr.console.aliyun.com/)
2. Select your region
3. Create a namespace (if not exists)
4. Create a repository under the namespace (optional, auto-created on first push)

### 5. Workflow Triggers

The workflow is triggered by:
- **Release**: Automatically builds and pushes when a new release is published
- **Manual Dispatch**: Can be triggered manually from the Actions tab

### 6. Image Tags

The workflow creates two tags for each build:
- `latest`: Always points to the most recent build
- `<version>`: The version from the release tag (e.g., `v0.2.1`)

## Testing the Workflow

After setting up the secrets:

1. Create a new release in your repository
2. The workflow will automatically trigger and build the Docker image
3. Check the Actions tab to monitor the build progress
4. Once complete, the image will be available in your Aliyun ACR

## Troubleshooting

- **Authentication Failed**: Verify your `ALIYUN_USERNAME` and `ALIYUN_PASSWORD` are correct
- **Registry Not Found**: Check that `ALIYUN_REGISTRY` matches your selected region
- **Namespace Error**: Ensure the namespace exists in your Aliyun ACR console
- **Permission Denied**: Verify your account has push permissions to the registry

## Security Best Practices

- Never commit credentials directly to your repository
- Use GitHub Secrets to store sensitive information
- Regularly rotate your Aliyun ACR passwords
- Consider using RAM (Resource Access Management) sub-accounts with limited permissions
