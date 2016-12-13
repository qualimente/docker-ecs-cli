# Overview #

Create a Docker image for the Amazon Elastic Container Service CLI that provides a portable, contained experience.

# Usage #

Export AWS credential &amp; region configuration as environment variables:

```
export AWS_ACCESS_KEY_ID="<id>"
export AWS_SECRET_ACCESS_KEY="<key>"
export AWS_DEFAULT_REGION="<region>"
```

Export a shell alias for `ecs-cli`:

```
alias ecs-cli='docker run --rm -it -e "AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID}" -e "AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY}" -e "AWS_DEFAULT_REGION=${AWS_DEFAULT_REGION}" -v "$(pwd):/work" -v "$HOME/.ecs/config:/root/.ecs/config" qualimente/ecs-cli'
```

Note! ecs-cli relies on state configured in `~/.ecs/config` for most commands, particularly the ECS cluster name.

Therefore it is advisable to run `ecs-cli configure` as a first step with the name of the cluster you will be working with, `example` below:

```
$ ecs-cli configure --cluster example
INFO[0000] Saved ECS CLI configuration for cluster (example)
```

Note!  If you are using the `ecs-cli` alias defined above, the `ecs-cli configure` command probably saved your credentials to the host's local disk.  Inspect and modify the `~/.ecs/config` file, if desired.

The ecs-cli image's entrypoint command is `ecs-cli`, so you may use the image as a drop-in replacement on your system, e.g. to list the containers running on an ECS cluster:

```
ecs-cli ps
```

