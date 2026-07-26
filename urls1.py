# myapp/urls.py
from rest_framework.routers import DefaultRouter
from .views import hotelDetailsViewSet
 
router = DefaultRouter()
router.register(r'hotelDetails', hotelDetailsViewSet)

urlpatterns = router.urls