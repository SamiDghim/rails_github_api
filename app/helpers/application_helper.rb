module ApplicationHelper
  def render_cards(sm: 1, md: 2, lg: 3, xl: 4, gap: 4, &block)
    render(partial: '/partials/cards', locals: { sm: sm, md: md, lg: lg, xl: xl, gap: gap, block: block })
  end

  def render_badge(  icon: "", color: "secondary", classes: "", data: {}, &block)
    render(partial: '/partials/badge', locals: { color: color, icon: icon, classes: classes, data: data, block: block })
  end

  def render_avatar(url, size = "medium", classes = "")
    render(partial: '/partials/avatar', locals: { url: url, size: size, classes: classes })
  end

  def human_pluralize( count )
    number_to_human(count, format: '%n%u', precision: 2, units: { thousand: 'K' })
  end
end
