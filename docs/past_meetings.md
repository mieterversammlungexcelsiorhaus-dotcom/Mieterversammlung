---
layout: default
---
# Past meetings

{% for meeting in site.past_meetings %}
## [{{ meeting.date | date_to_string }}]({{ meeting.url | absolute_url }})
{% endfor %}

