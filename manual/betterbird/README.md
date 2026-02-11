# Betterbird setup

## Version A: create a new profile

### Step 1

Run:
```
betterbird -P
```

Create a new profile named `main` and as the directory for the profile choose `~/.thunderbird/main`.

### Step 2

#### Option A: you already have a betterbird profile

Inside `~/.thunderbird/main` backup existing profile data `~/.thunderbird/PREVIOUSPROFILE` and `profiles.ini`.
Fill the `~/.thunderbird/main` (created with `betterbird -P`) with data from the previous profile.
```
rsync -a --info=progress2 ~/.thunderbird/PREVIOUSPROFILE/ ~/.thunderbird/main/
```

Use `profiles.ini` for reference to create a new `~/.thunderbird/profiles.ini`.

#### Option B: you don't have a betterbird profile

Copy `profiles.ini` to `~/.thunderbird.profiles.ini`.

### Step 3

Copy `user.js` to `~/.thunderbird/main/user.js`.

```
rsync -a --info=progress2 user.js ~/.thunderbird/main/user.js
```

## Version B: use existing profile

### Step 1

Copy `user.js` to `~/.thunderbird/EXISTINGPROFILE/user.js`.

