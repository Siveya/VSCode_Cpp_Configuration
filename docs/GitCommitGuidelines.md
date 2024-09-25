# Git Commit Guidelines
### 来自[AngularJS](https://github.com/angular/angular.js/blob/master/DEVELOPERS.md)

### Commit Message Format
Each commit message consists of a **header**, a **body** and a **footer**.  The header has a special
format that includes a **type**, a **scope** and a **subject**:

每条提交消息由**标题**、**主体**和**尾部**组成。标题的格式包括**类型**、**范围**和**主题**：

```
<type>(<scope>): <subject>
<BLANK LINE>
<body>
<BLANK LINE>
<footer>
```

The **header** is mandatory and the **scope** of the header is optional.

**标题**是必填项，而**范围**是可选的。

Any line of the commit message cannot be longer than 100 characters! This allows the message to be easier
to read on GitHub as well as in various git tools.

提交消息的任意一行不得超过 100 个字符！这样可以提高在 GitHub 及各种 Git 工具中的可读性。

### Revert
If the commit reverts a previous commit, it should begin with `revert: `, followed by the header
of the reverted commit.
In the body it should say: `This reverts commit <hash>.`, where the hash is the SHA of the commit
being reverted.

如果该提交是撤销之前的提交，则应以 `revert: `开头，后跟被撤销提交的标题。主体部分应写为 `This reverts commit <hash>.`，其中 hash 是被撤销提交的 SHA。

### Type
Must be one of the following:

必须为以下之一：
* **feat**: A new feature， 新功能
* **fix**: A bug fix， 修复 bug
* **docs**: Documentation only changes，仅文档更改
* **style**: Changes that do not affect the meaning of the code (white-space, formatting, missing
  semi-colons, etc)，不影响代码含义的更改（如空格、格式、缺少分号等）
* **refactor**: A code change that neither fixes a bug nor adds a feature，既不修复 bug 也不添加新功能的代码更改
* **perf**: A code change that improves performance，提高性能的代码更改
* **test**: Adding missing or correcting existing tests，添加缺失的或修正现有的测试
* **chore**: Changes to the build process or auxiliary tools and libraries such as documentation
  generation，对构建过程或辅助工具和库的更改，例如文档生成

### Scope
The scope could be anything specifying place of the commit change. For example `$location`,
`$browser`, `$compile`, `$rootScope`, `ngHref`, `ngClick`, `ngView`, etc...

范围可以是指定提交更改的任何内容。例如 `$location`,
`$browser`, `$compile`, `$rootScope`, `ngHref`, `ngClick`, `ngView` 等等。

You can use `*` when the change affects more than a single scope.

如果更改影响多个范围，可以使用 *。


### Subject
The subject contains succinct description of the change:

主题应包含对更改的简洁描述：

* use the imperative, present tense: "change" not "changed" nor "changes"
* don't capitalize first letter
* no dot (.) at the end

### Body
Just as in the **subject**, use the imperative, present tense: "change" not "changed" nor "changes".
The body should include the motivation for the change and contrast this with previous behavior.

和主题一样，使用命令式现在时：使用“change”而不是“changed”或“changes”。主体应包括更改的动机，并与之前的行为进行对比。

### Footer
The footer should contain any information about **Breaking Changes** and is also the place to reference GitHub issues that this commit closes closing-issues.

尾部应包含有关**Breaking Changes**的信息，并且也是引用此提交关闭 GitHub 问题的地方。

**Breaking Changes** should start with the word `BREAKING CHANGE:` with a space or two newlines.
The rest of the commit message is then used for this.

破坏性更改应以 `BREAKING CHANGE:` 开头，后跟一个空格或两个换行符。其余的提交消息则用于此。

### Example
***添加新功能***
```
feat(user): add login functionality

Implement login feature that allows users to log in using their email and password.
This includes input validation and error messages for invalid credentials.

BREAKING CHANGE: The login API now requires a new `rememberMe` parameter.
```

***修复 bug***
```
fix(cart): correct total price calculation

Fix the issue where the total price did not update correctly when items were removed from the cart.
This resolves the inconsistencies in the displayed total price.

Closes #45.
```

***文档更新***
```
docs(README): update installation instructions

Update the installation section in the README to include instructions for the latest version of Node.js.
This helps new users to set up the project correctly.

No functional changes.
```

***代码重构***
```
refactor(api): simplify user authentication logic

Refactor the user authentication logic to reduce complexity and improve readability.
This change does not affect the external behavior of the authentication process.

No breaking changes.
```

***添加测试***
```
test(user): add tests for login functionality

Add unit tests for the login functionality to ensure proper validation and error handling.
This increases test coverage and helps prevent regressions in the future.

No breaking changes.
```
