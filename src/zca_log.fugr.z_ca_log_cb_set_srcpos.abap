FUNCTION Z_CA_LOG_CB_SET_SRCPOS.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     REFERENCE(IT_SRCPOS) TYPE  ZCA_TT_LOG_SRCPOS
*"----------------------------------------------------------------------
  gt_srcpos = it_srcpos.
  SORT gt_srcpos BY lognr msgnumber.
ENDFUNCTION.
