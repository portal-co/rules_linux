rootify_attrs = {
    "_rootify": ctx.label(default = "@rootify//:rootify")
}

def chroot_cmd(ctx, name, command, chroot):
    tgt = ctx.actions.declare_file(name + ".tar")
    ctx.actions.run(inputs = [chroot] + ctx.attr._rootify.files.to_list(), outputs = [tgt], command = f"tar -xvf {chroot.path} -C tgt;./rootify chroot $(pwd)/tgt {command};tar -cvC tgt > {name}.tar")
    return tgt

