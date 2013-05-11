# Public: Sets the size of the dock icons.
#
# tile_size - sets the size of the dock icon. Defaults to 46.
#
# Examples
#
#   # set the dock icon size to 46 (default).
#   include osx::dock::tile_size
#
#   # ...or pick your own size!
#   class { 'osx::dock::tile_size':
#     tile_size => 52
#   }
class osx::dock::tile_size ($tile_size=46) {
  include osx::dock

  boxen::osx_defaults { 'Sets the size of the icons in the dock':
    user   => $::boxen_user,
    key    => 'tilesize',
    domain => 'com.apple.dock',
    value  => $tile_size,
    type   => 'int',
    notify => Exec['killall Dock'];
  }
}
