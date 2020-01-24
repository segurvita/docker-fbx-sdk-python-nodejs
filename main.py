from fbx import *


def list_reader_format(manager):
    print('# FBX SDK can read the following formats.')
    for formatIndex in range(manager.GetIOPluginRegistry().GetReaderFormatCount()):
        description = manager.GetIOPluginRegistry().GetReaderFormatDescription(formatIndex)
        print format(formatIndex, '02d'), description


def main():
    # Create
    manager = FbxManager.Create()
    scene = FbxScene.Create(manager, "fbxScene")

    # List
    list_reader_format(manager)

    # Destroy
    scene.Destroy()
    manager.Destroy()


if __name__ == '__main__':
    main()
