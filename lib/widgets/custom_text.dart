import 'package:flutter/material.dart';
import 'package:guideme/core/constants/constants.dart';

class LimitedTextWidget extends StatefulWidget {
  final String description;

  const LimitedTextWidget({Key? key, this.description = ''}) // Nilai default kosong
      : super(key: key);

  @override
  _LimitedTextWidgetState createState() => _LimitedTextWidgetState();
}

class _LimitedTextWidgetState extends State<LimitedTextWidget> {
  bool isExpanded = false; // Status untuk mengecek apakah teks sedang diperluas

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.zero, // Menghapus padding pada Column
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            textAlign: TextAlign.justify,
            widget.description.isNotEmpty ? widget.description : 'No description available.', // Tampilkan teks default jika kosong
            maxLines: isExpanded ? null : 4, // Batasi maksimal 4 baris jika tidak diperluas
            // overflow: TextOverflow.ellipsis, // Tambahkan ellipsis (...) jika teks terpotong
            style: AppTextStyles.mediumStyle,
          ),
          if (widget.description.isNotEmpty) // Tombol hanya muncul jika ada deskripsi
            SizedBox(
              height: 4,
            ),
          InkWell(
            onTap: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  isExpanded ? 'Read Less' : 'Read More',
                  style: AppTextStyles.mediumStyle.copyWith(decoration: TextDecoration.underline),
                ),
                Icon(
                  isExpanded ? Icons.expand_less : Icons.expand_more,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
