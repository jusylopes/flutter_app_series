import 'package:flutter/material.dart';
import 'package:flutter_app_series/data/models/tv_show.dart';
import 'package:flutter_app_series/providers/tv_show_view_model.dart';
import 'package:flutter_app_series/view/widgets/widgets_exports.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class TvShowFormScreen extends StatefulWidget {
  final TvShow? tvShow;
  const TvShowFormScreen({super.key, this.tvShow});

  @override
  State<TvShowFormScreen> createState() => _TvShowFormScreenState();
}

class _TvShowFormScreenState extends State<TvShowFormScreen> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _titleController;
  late final TextEditingController _streamController;
  late final TextEditingController _summaryController;
  var _rating = 0;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.tvShow?.title ?? '');
    _streamController = TextEditingController(
      text: widget.tvShow?.stream ?? '',
    );
    _summaryController = TextEditingController(
      text: widget.tvShow?.summary ?? '',
    );
    _rating = widget.tvShow?.rating ?? 0;
  }

  @override
  void dispose() {
    _titleController.dispose();
    _streamController.dispose();
    _summaryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var isEditing = widget.tvShow != null;

    void submit() {
      if (_formKey.currentState!.validate()) {
        final newTvShow = TvShow(
          title: _titleController.text,
          stream: _streamController.text,
          summary: _summaryController.text,
          rating: _rating,
        );

        isEditing
            ? context.read<TvShowViewModel>().editTvShow(
              widget.tvShow!,
              newTvShow,
              context,
            )
            : context.read<TvShowViewModel>().addTvShow(newTvShow, context);

        context.go('/');
      }
    }

    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        spacing: 16,
        children: [
          Text(
            isEditing ? 'Editar Série' : 'Adicionar Série',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Form(
            key: _formKey,
            child: Column(
              spacing: 16,
              children: [
                CustomTextFormField(
                  titleController: _titleController,
                  labelText: 'Título',
                  textInputAction: TextInputAction.next,
                ),

                CustomTextFormField(
                  titleController: _streamController,
                  labelText: 'Stream',
                  textInputAction: TextInputAction.next,
                ),

                CustomTextFormField(
                  titleController: _summaryController,
                  labelText: 'Resumo',
                  textInputAction: TextInputAction.next,
                ),

                Container(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Nota: ', style: TextStyle(fontSize: 16)),
                      StarRating(
                        value: _rating,
                        onRatingChanged: (rating) {
                          setState(() {
                            _rating = rating;
                          });
                        },
                      ),
                    ],
                  ),
                ),

                ElevatedButton(
                  onPressed: submit,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    foregroundColor: Theme.of(context).colorScheme.onPrimary,
                  ),
                  child: Text(
                    isEditing ? 'EDITAR' : 'ADICIONAR',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
