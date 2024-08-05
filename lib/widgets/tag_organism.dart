import 'package:complainz/config/app_colors.dart';
import 'package:complainz/config/app_sizes.dart';
import 'package:complainz/widgets/app_chips.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TagOrganism extends StatefulWidget {
  final List<String> listChips;
  final EdgeInsets? padding;
  final EdgeInsets? paddingTagsBody;
  final double? fontSize;
  final double? runSpacing;
  final IconData? leftIcon;
  final List<Color>? selectedColor;
  final void Function(int)? onTap;
  String? selected;
  TagOrganism({
    super.key,
    required this.listChips,
    required this.onTap,
    this.padding,
    this.fontSize,
    this.runSpacing,
    this.leftIcon,
    this.selected,
    this.selectedColor,
    this.paddingTagsBody,
  });

  @override
  State<TagOrganism> createState() => _TagOrganismState();
}

class _TagOrganismState extends State<TagOrganism> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.zero,
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Row(
        children: [
          ...List.generate(widget.listChips.length, (index) {
            return Padding(
              padding: index == widget.listChips.length - 1
                  ? EdgeInsets.zero
                  : EdgeInsets.only(
                      right: widget.runSpacing ?? AppSizes.padding / 2),
              child: AppChips(
                leftIcon: widget.leftIcon,
                selectedColor:
                    widget.selectedColor?[index] ?? AppColors.primaryColor,
                fontSize: widget.fontSize ?? 16,
                padding: widget.padding ??
                    const EdgeInsets.symmetric(
                        horizontal: AppSizes.padding,
                        vertical: AppSizes.padding / 2),
                text: widget.listChips[index],
                onTap: () {
                  setState(() {
                    widget.onTap!(index);
                  });
                },
                // ignore: unrelated_type_equality_checks
                isSelected: widget.selected == index ? true : false,
              ),
            );
          })
        ],
      ),
    );
  }
}
