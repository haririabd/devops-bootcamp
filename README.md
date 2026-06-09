# DevOps Bootcamp 2026

- Repo peribadi untuk semua kerja amali bootcamp. 
- **Satu repo, isi bertambah setiap sesi.**
- Setiap topik masuk melalui **branch + PR**.

## Aliran kerja setiap sesi

```bash
git checkout -b <sesi>            # cth: aws1, docker1, terraform1
mkdir <sesi>                      # folder artefak sesi
# ... tambah fail output, nota, Dockerfile, .tf ...
git add .
git commit -m "<Sesi>: <ringkasan>"
git push -u origin <sesi>
gh pr create --fill
gh pr merge --squash --delete-branch
```

Hantar **pautan PR** ke Infratify LMS.
