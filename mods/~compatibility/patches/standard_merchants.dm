// Add the vox merchant if the Vox modpack is enabled.
#ifdef MODPACK_VOX
#include "standard_merchants/vox_merchant.dm"
#endif

// Add the SM to specific merchants if the SM modpack is enabled.
#ifdef CONTENT_PACK_SUPERMATTER
#include "standard_merchants/supermatter_merchant.dm"
#endif