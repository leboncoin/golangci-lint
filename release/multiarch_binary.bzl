def _transition_platform_impl(_, attr):
    return [{
        "//command_line_option:platforms": platform,
    } for platform in attr.platforms]

_transition_platform = transition(
    implementation = _transition_platform_impl,
    inputs = [],
    outputs = ["//command_line_option:platforms"],
)

def _multiarch_binary_impl(ctx):
    return [DefaultInfo(files = depset(ctx.files.binary))]

multiarch_binary = rule(
    implementation = _multiarch_binary_impl,
    attrs = {
        "binary": attr.label(
            mandatory = True,
            cfg = _transition_platform,
        ),
        "platforms": attr.string_list(mandatory = True),
        "_allowlist_function_transition": attr.label(
            default = "@bazel_tools//tools/allowlists/function_transition_allowlist",
        ),
    },
)
