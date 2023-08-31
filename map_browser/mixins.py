from django.shortcuts import get_object_or_404


class ActiveObjectFilterMixin:

    def get_queryset(self):
        queryset = super().get_queryset()
        if not self.request.user.is_authenticated:
            queryset = queryset.filter(is_active=True)
        return queryset

    def get_object(self, queryset=None):
        if not self.request.user.is_authenticated:
            obj = get_object_or_404(self.model, pk=self.kwargs['pk'], is_active=True)
        else:
            obj = get_object_or_404(self.model, pk=self.kwargs['pk'])

        return obj

    # def get_context_data(self, *, object_list=None, **kwargs):
    #     context = super().get_context_data(**kwargs)
    #     title = self.request.GET.get('title')
    #     if title:
    #         context.update({'title': title})
    #     return context