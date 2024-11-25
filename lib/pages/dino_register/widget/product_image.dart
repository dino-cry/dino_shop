import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProductImage extends StatelessWidget {
  final picker = ImagePicker();
  List<XFile?> selectedImages = []; // 갤러리에서 선택한 이미지

  List<XFile?> images; // 보여질 이미지들
  Function(List<XFile?> images) selectImages;
  Function(XFile? image) deleteImage;

  ProductImage(this.images, this.selectImages, this.deleteImage);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          getImageBox(),
          ...List.generate(images.length, (int i) => imageBox(i))
        ],
      ),
    );
  }

  /// 갤러리에서 이미지 가져올 위젯
  Container getImageBox() {
    return Container(
      height: 64,
      width: 64,
      child: IconButton(
        onPressed: () async {
          // image picker 로 갤러리에서 가져온 이미지
          selectedImages = await picker.pickMultiImage();
          // 갤러리에서 가져온 이미지들 images 에 추가
          selectImages(selectedImages);
        },
        icon: Icon(Icons.camera_alt_outlined),
        color: Colors.grey,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }

  /// 선택한 이미지 위젯
  Padding imageBox(int index) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          // 이미지 박스
          Container(
            height: 64,
            width: 64,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                fit: BoxFit.cover,
                // images 리스트에 있는 사진 순서대로 보여줌
                image: FileImage(File(images[index]!.path)),
              ),
            ),
          ),
          // 취소 버튼
          GestureDetector(
            onTap: () {
              // x 버튼 누르면 images 에서 해당 사진 지우기
              deleteImage(images[index]);
            },
            child: Container(
              child: Icon(
                Icons.close,
                color: Colors.black,
                size: 15,
              ),
              decoration: BoxDecoration(
                color: Color(0xFFFFF068),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
