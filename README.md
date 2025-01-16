# My Personal Website

This is the source repository for my personal
website hosted on github pages.

## Development

This site uses mkdocs under the hood to generate
the site static html content.

In addition, [mike](https://github.com/jimporter/mike)
is used to version the documentation.

### Getting Started

Make sure you have configured a virtual environment.

```bash
python -m venv venv
source venv/bin/active
pip install --upgrade pip && pip install -r requirements.txt
```

### Live Reloads

To edit the site with live reloads, use

```bash
make serve
```

To build the site with mkdocs

```bash
make build
```

### Mike

Mike is used to version the website. The CI step `deploy`
in [pages.yaml](./.github/workflows/pages.yaml#L42) is
responsible for deploying the versioned content using
a github actions bot onto the `gh-pages` branch.

In order for the CI to deploy an updated version of the
documentation, a git tag and corresponding release must be
created.

The workflow is as follows:

```bash
git checkout -b feat/your-feature
... open vscode and make changes ...
git add .
git commit -m "feat: added foo"
git push -u origin feat/your-feature
```

Open a pull request, and then merge.
Once the changes are merged onto the main branch,
a github workflow is triggered which will lint and
test that the site builds correctly. Once you have verified
that the actions have all run successfully, create a git tag
and push it:

```bash
git tag vX.X.X
git push -u origin vX.X.X
```

Next, generate a release from the git UI. This will trigger
a deployment of the docs site (see [pages.yaml](.github/workflows/pages.yaml#L42)).

#### Important Note Regarding the gh-pages Branch

Note the structure of the `gh-pages` branch. This structure
is generated by `mike` and is updated from each `deploy` step
in the github action. If you are looking to implement versioning,
you should restructure your `gh-pages` branch locally, push
the changes, and then `mike` will take it from there.

To restructure your repository locally:

```bash
git checkout gh-pages
rm -r *
git push -u origin gh-pages
```

Now the CI will be able to run succesfully and start versioning
your docs repo.
