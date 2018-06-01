openbsd-ldapd
=============

This role sets up an ldapd server geared towards serving logins to OpenBSD hosts.

Requirements
------------

- OpenBSD


Role Variables
--------------

| Variable | Default Value | Description |
| -------- | ------------- | ----------- |
| `ldap_domain` | "bolddaemon" | This is the name of your domain. If your FQDN was "example.com", this value would be "example". |
| `ldap_tld` | "com" | The TLD of your domain. If your FQDN is "example.com", this would be "com". |
| `ldap_admin` | "admin" | The `rootdn`. This will ultimately resolve to: `cn={{ ldap_admin }},dc={{ ldap_domain }},dc={{ ldap_tld }}`. |
| `ldap_admin_pass` | "welcome" | Password for `rootdn`. This will be piped to `encrypt(1)` and stored in `/etc/ldapd.conf` as a hash.|
| `ldap_uid_start` | 1000 | The starting point for UID. This value auto-increments for every user defined in `ldap_users`. |
| `ldap_gid_start` | 1000 | The starting point for GID. This also auto-increments. |
| `ldap_users` | array of objects that include: `uid`, `first`, `last`, `pw_hash` and optionally `pubkey` and `shell`. | The users defined here will be added to `/root/users.ldif`, which can then be used to bootstrap the ldap server. |

Dependencies
------------

- OpenBSD

Example Playbook
----------------

    - hosts: openbsd_ldap_servers
      roles:
         - { role: openbsd-ldapd, tags: ["ldapd"] }

License
-------

```
/*
 * Copyright (c) 2018 Aaron Bieber <aaron@bolddaemon.com>
 *
 * Permission to use, copy, modify, and distribute this software for any
 * purpose with or without fee is hereby granted, provided that the above
 * copyright notice and this permission notice appear in all copies.
 *
 * THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
 * WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
 * ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
 * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
 * ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
 * OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
 */
 ```
