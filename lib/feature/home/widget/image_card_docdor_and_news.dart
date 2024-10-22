import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ImageCardDocdorAndNews extends StatefulWidget {
  const ImageCardDocdorAndNews({super.key, this.height, required this.assetName, required this.icon, required this.isFavourite, this.onPressed, required this.title,});
  final double? height;
  final String assetName;
  final Widget icon;
  final bool isFavourite;
  final void Function()? onPressed;
  final String title;

  @override
  State<ImageCardDocdorAndNews> createState() => _ImageCardDocdorAndNewsState();
}

class _ImageCardDocdorAndNewsState extends State<ImageCardDocdorAndNews> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: widget.height,
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 10.0,
                spreadRadius: 1.0,
                offset: Offset(0.0, 0.0),
              ),
            ],
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(80), bottomLeft: Radius.circular(30)),
            image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage(widget.assetName)),
          ),
          child:  Align(
                      alignment: Alignment.bottomLeft,
                      child: Container(
                        padding:
                            const EdgeInsets.all(8.0), 
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.black.withOpacity(0.4),
                              Colors.black.withOpacity(0.3),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(12),
                            topRight: Radius.circular(12),
                          ),
                        ),
                        child: Text(
                        widget.title,  
                          style: GoogleFonts.roboto(
                            textStyle: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              shadows: [
                                Shadow(
                                  color: Colors.black.withOpacity(0.6),
                                  offset: const Offset(1, 2),
                                  blurRadius: 4,
                                ),
                              ],
                            ),
                          ),
                          maxLines:
                              2, // Başlığın uzun olmasına karşılık satır sınırlaması
                          overflow: TextOverflow
                              .ellipsis, // Uzun metinlerin sonuna "..." koyar
                        ),
                      ),
                    ),
        ),
        Positioned(
          top: widget.height! * 0.01,
          left: widget.height! * 0.02,
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: widget.isFavourite
                  ? const Icon(Icons.favorite_rounded, color: Colors.red)
                  : const Icon(Icons.favorite_border_rounded,
                      color: Colors.blue),
              onPressed: widget.onPressed,
            ),
            
          ),
        )
        
      ],
    );
  }
}
