Run `archinstall --config config.json --creds creds.json`, where `creds.json` could look like following:
```json
{
    "users": [
        {
            "sudo": true,
            "username": "archinstall",
            "enc_password": "password_hash"

        }
    ],
    "root_enc_password": "password_hash"
}
```
