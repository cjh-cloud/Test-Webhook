# NPM Test & Post 
This GitHub Action will run NPM Test and POST the result to an HTTP endpoint

## Configuration

Add a secret to your repo called WEBHOOK_URL with the HTTP endpoint you want to POST to. 
You can test your action with [Post Bin.](https://postb.in/)

This Action will fail if either the test or the webhook fails. 
Check the Action logs to see which part failed.

### Example Usage

Create a new Actions workflow in your selected GitHub repository. 
Create a new file titled `action.yml` in the `.github/workflows` directory of your repository. 
Paste the following code:

**Check and use the latest version**

```
name: NPM Test & Webhook
on: push

jobs:
  webhook:
    name: NPM Test & Webhook action
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v1
    - name: Run NPM Test & POST
      uses: SenorGrande/test-webhook@v1
      env:
        WEBHOOK_URL: ${{ secrets.WEBHOOK_URL }} 
```
