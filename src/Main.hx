package;

import vox.VoxReader;

class Main {
  public static function main() {
    var fnames = Sys.args();
    for(fname in fnames) {
      var reader = new VoxReader(fname);
      for(model in reader.models) {
        trace(model.data);
      }
    }
  }
}
