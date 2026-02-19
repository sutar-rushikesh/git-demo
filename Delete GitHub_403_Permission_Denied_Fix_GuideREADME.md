# GitHub 403 Permission Denied Error (Fix Guide)

## 🚨 Issue

While pushing code to GitHub, the following error occurred:

    remote: Permission to youraccountname
    fatal: unable to access 'https://github.com/youraccountname.git/':
    The requested URL returned error: 403

------------------------------------------------------------------------

## 🔎 Root Cause

This error occurs when:

-   The GitHub repository belongs to a different account.
-   Git is authenticated with another GitHub user.
-   Stored Windows credentials contain incorrect GitHub login.
-   The authenticated user does not have permission to access the
    repository.

In this case:

-   Repository Owner: `youraccountname`
-   Authenticated User: `loggedinyouser`

GitHub blocked the push request due to insufficient permissions.

------------------------------------------------------------------------

## 🛠️ Solution Methods

### ✅ Solution 1: Verify Repository Ownership

Check repository URL:

    git remote -v

Ensure the repository belongs to the correct GitHub account.

If incorrect, update remote URL:

    git remote set-url origin https://github.com/sutar-rushikesh/git-demo.git

------------------------------------------------------------------------

### ✅ Solution 2: Remove Stored GitHub Credentials (Windows)

Windows stores GitHub credentials, which may cause authentication
conflicts.

#### Steps:

1.  Press `Windows + R`

2.  Type:

        control keymgr.dll

3.  Open **Windows Credentials**

4.  Remove all entries related to:

    -   `github.com`

Then retry:

    git push -u origin main

When prompted: - Enter correct GitHub username - Use **Personal Access
Token (PAT)** instead of password

------------------------------------------------------------------------

### ✅ Solution 3: Generate Personal Access Token (PAT)

GitHub does not accept account passwords for Git operations.

#### Steps:

1.  Go to GitHub → Settings
2.  Developer Settings
3.  Personal Access Tokens
4.  Generate new token
5.  Copy token
6.  Use token as password when pushing

------------------------------------------------------------------------

## 🚀 Recommended Professional Solution (SSH Method)

For DevOps best practices, use SSH authentication instead of HTTPS.

### Advantages:

-   No repeated password entry
-   More secure
-   No credential conflicts
-   Industry-standard practice

------------------------------------------------------------------------

## 🔐 SSH Setup Overview

    ssh-keygen -t ed25519 -C "your-email@example.com"

Add generated public key to:

GitHub → Settings → SSH and GPG Keys

Then change remote:

    git remote set-url origin git@github.com:sutar-rushikesh/git-demo.git

Push normally:

    git push

------------------------------------------------------------------------

## 📚 Key Takeaways

-   Always verify repository ownership
-   Clear stored credentials when switching accounts
-   Use Personal Access Token instead of password
-   Prefer SSH for professional DevOps workflow

------------------------------------------------------------------------

## 🏷️ Tags

`git` `github` `devops` `403-error` `authentication` `ssh` `windows`
