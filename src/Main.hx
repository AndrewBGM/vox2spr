package;

import sys.FileSystem;
import format.png.Writer;
import haxe.io.Path;
import sys.io.File;
import format.png.Tools;
import haxe.io.BytesOutput;
import vox.VoxReader;

class Main {
  public static function main() {
    var fnames = Sys.args();
    for(fname in fnames) {
      var reader = new VoxReader(fname);
      for(model in reader.models) {
        for(z in 0...model.zsize) {
          var bytes = new BytesOutput();
          for(y in 0...model.ysize) {
            for(x in 0...model.xsize) {
              var color = model.get(x, y, z);
              if (color != 0) {
                bytes.writeInt32(color);
              } else {
                bytes.writeInt32(0x00000000);
              }
            }
          }

          var data = Tools.build32BGRA(model.xsize, model.ysize, bytes.getBytes());
          FileSystem.createDirectory(Path.withoutExtension(fname));
          var out = File.write(Path.withoutExtension(fname) + '/$z.png');
          (new Writer(out)).write(data);
        }
      }
    }
  }
}
