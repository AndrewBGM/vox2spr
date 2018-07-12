package vox;

class VoxModel {
  public var xsize(default, null): Int;
  public var ysize(default, null): Int;
  public var zsize(default, null): Int;

  public var data: Array<Array<Array<Int>>>;

  public function new(xsize: Int, ysize: Int, zsize: Int) {
    this.xsize = xsize;
    this.ysize = ysize;
    this.zsize = zsize;

    data = [for(z in 0...zsize) [for(y in 0...ysize) [for(x in 0...xsize) 0]]];
  }

  public function set(x: Int, y: Int, z: Int, v: Int) {
    data[z][y][x] = v;
  }

  public function get(x: Int, y: Int, z: Int) {
    return data[z][y][x];
  }
}
