## Answer Key to gemv example :


  // ----- PE (0, 0): left column, top row -----
  @set_color_config(0, 0, ax_color, .{.routes = .{ .rx = .{ RAMP }, .tx = .{ EAST } }});
  @set_color_config(0, 0, x_color,  .{.routes = .{ .rx = .{ RAMP }, .tx = .{ RAMP,SOUTH } }});

  // ----- PE (1, 0): right column, top row -----
  @set_color_config(1, 0, ax_color, .{.routes = .{ .rx = .{ WEST }, .tx = .{ RAMP } }});
  @set_color_config(1, 0, x_color,  .{.routes = .{ .rx = .{ RAMP }, .tx = .{ RAMP,SOUTH } }});

  // ----- PE (0, 1): left column, bottom row -----
  @set_color_config(0, 1, ax_color, .{.routes = .{ .rx = .{ RAMP }, .tx = .{ EAST } }});
  @set_color_config(0, 1, x_color,  .{.routes = .{ .rx = .{ NORTH }, .tx = .{ RAMP } }});

  // ----- PE (1, 1): right column, bottom row -----
  @set_color_config(1, 1, ax_color, .{.routes = .{ .rx = .{ WEST }, .tx = .{ RAMP } }});
  @set_color_config(1, 1, x_color,  .{.routes = .{ .rx = .{ NORTH }, .tx = .{RAMP } }});
