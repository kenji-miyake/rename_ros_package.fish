# rename_ros_package.fish

fish script to rename ros package

## Prerequisites

```sh
brew install fd sd rename
```

## Usage

```sh
cp -r YOUR_ROS_PACKAGE NEW_ROS_PACKAGE
cd NEW_ROS_PACKAGE
curl -fsSL https://raw.githubusercontent.com/kenji-miyake/rename_ros_package.fish/main/rename_ros_package.fish | fish
```
