;!----------------------------------------------------------------------------!
;!                                                                            !
;! Licence et conditions d'utilisation                                        !
;! Yexpert : (your) Systeme Expert sous Mumps GT.M et GNU/Linux               !
;! Copyright (C) 2001-2015 by Hamid LOUAKED (HL).                             !
;!                                                                            !
;! Hamid LOUAKED                                                              !
;! 10, impasse Faraday                                                        !
;! 78520 LIMAY                                                                !
;! France                                                                     !
;!                                                                            !
;! yexpert@yrelay.fr                                                          !
;! http://www.yrelay.fr/                                                      !
;!                                                                            !
;! Ce programme est un logiciel libre ; vous pouvez le redistribuer           !
;! et/ou le modifier conformement aux dispositions de la Licence Publique     !
;! Generale GNU, telle que publiee par la Free Software Foundation ;          !
;! version 3 de la licence, ou encore (a votre choix) toute version ulterieure.
;!                                                                            !
;! Ce programme est distribue dans l'espoir qu'il sera utile,                 !
;! mais SANS AUCUNE GARANTIE ; sans meme la garantie implicite de             !
;! COMMERCIALISATION ou D'ADAPTATION A UN OBJET PARTICULIER.                  !
;! Pour plus de details, voir la Licence Publique Generale GNU.               !
;!                                                                            !
;! Un exemplaire de la Licence Publique Generale GNU doit etre fourni avec    !
;! ce programme ; si ce n'est pas le cas,                                     !
;! ecrivez a la Free Software Foundation Inc.,                                !
;! 675 Mass Ave, Cambridge, MA 02139, Etats-Unis.                             !
;!                                                                            !
;! Ce logiciel est telechargeable a l'adresse http://www.yrelay.fr/ ;         !
;! vous trouverez egalement, sur ce site, un mode d'emploi complet            !
;! et des informations supplementaires.                                       !
;!                                                                            !
;!----------------------------------------------------------------------------!
;!                                                                            !
;! GNU General Public License : http://www.gnu.org/copyleft/gpl.html          !
;!                                                                            !
;! Traduction francaise : http://dachary.org/loic/gpl-french.pdf              !
;!                                                                            !
;!----------------------------------------------------------------------------!

;!============================================================================!
;! Nomprog     : %SGPXOU2                                                     !
;! Module      : Sauvegarde (SG)                                              !
;! But         :                                                              !
;!                                                                            !
;! Description :                                                              !
;!                                                                            !
;!                                                                            !
;!                                                                            !
;!                                                                            !
;!                                                                            !
;!----------------------------------------------------------------------------!
;! Modif ! Auteur ! Date     ! Commentaires                                   !
;!-------!--------!----------!------------------------------------------------!
;!       ! HL     ! 22/03/01 ! Creation                                       !
;! HL001 ! HL     ! 00/00/00 ! Description succincte de la modification.      !
;! HL002 ! HL     ! 00/00/00 !                                                !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

%SGPXOU2 ;
 
 
 
 
 
 
 
 
OUT N OPT,GLO,FILE,X0,X1,NUMOPT,Z,LIG,W,TAB,RESSAVE,%NOPT,NOSEL
 N ART,%A,TABART,TABOPT,LOPT
 D CLEPAG^%VVIDEO
 W !,"Sauvegarde des abaques ou du lexique "
 W !,?10,"1                  ",$$^%QZCHW("Abaques")
 W !,?10,"2                  ",$$^%QZCHW("lexique")
 W !,!,?10,$$^%QZCHW("Votre choix ( ex 1 ou 2) : ") R LOPT
 
 S:LOPT[2 TABOPT("DK15")=""
 
S2 S LISGLO=$$TEMP^%SGUTIL
 I LOPT[1 D SELABA,CLEPAG^%VVIDEO
 I LOPT[2 D SELLEX
 S FILE=WHOIS_".ARC",CTR="" D LIRE2^%VREAD("Nom du fichier : ",FILE,2,40,6,7,"","",.CTR,.FILE) G:CTR'="" ENDOUT G:FILE="" ENDOUT
 S COMMENT="" D LIRE2^%VREAD("Commentaire    : ",COMMENT,2,75,8,9,"","",.CTR,.COMMENT)
 
 S RESSAVE=$$GO^%SYSSAVE(LISGLO,FILE,QUI,COMMENT)
 I '(RESSAVE) D ^%VZEAVT($$^%QZCHW("Probleme lors de la sauvegarde"))
ENDOUT 
 D CLEPAG^%VVIDEO
 Q
 
SELABA 
 N X0,X1,LABA,GABA,LGABA,Z,TAB,LIG,W,GLO,NOSELABA,GG
 S LGABA=$$TEMP^%SGUTIL,LABA=$$TEMP^%SGUTIL,LSELABA=$$TEMP^%SGUTIL
 S X0="ZL %SYSDEF F Z=0:1 S TAB=$T(TO10+Z),LIG=$P(TAB,"";;"",2) Q:LIG=""""  X X1"
 S X1="F W=1:1 S GLO=$P(LIG,"","",W) Q:GLO=""""  S @LGABA@(GLO)="""""
 X X0
 S GABA="" F %GABA=0:0 S GABA=$O(@LGABA@(GABA)) Q:GABA=""  S GG="^[QUI]"_GABA,ABA="" F %ABA=0:0 S ABA=$O(@GG@(ABA)) Q:ABA=""  I '($F(ABA,"/COMMENT")) S @LABA@(ABA)=""
 D CLEPAG^%VVIDEO,^%VZCD0($$^%QZCHW("ABAQUES A SAUVEGARDER")),INIT^%QUCHOIP(LABA,1,"",0,5,80,17),AFF^%QUCHOIP,^%QUCHOYP(LSELABA),END^%QUCHOIP
 S ABA="" F %ABA=0:0 S ABA=$O(@LSELABA@(ABA)) Q:ABA=""  S GABA="" F %GABA=0:0 S GABA=$O(@LGABA@(GABA)) Q:GABA=""  D AJABA
 K @(LGABA),@(LABA),@(LSELABA)
 Q
 
AJABA S GG="^[QUI]"_GABA
 S:$D(@GG@(ABA)) @LISGLO@(GABA_"("""_ABA_""")")=""""_ABA_""""
 S ABACOM=ABA_"/COMMENT"
 S:$D(@GG@(ABACOM)) @LISGLO@(GABA_"("""_ABACOM_""")")=""""_ABACOM_""""
 Q
 
SELLEX 
 N X0,X1,GLO,Z,TAB,LIG,W,GLO
 S LGABA=$$TEMP^%SGUTIL,LABA=$$TEMP^%SGUTIL
 ;HL2 S X0="ZL %SYSDEF F Z=0:1 S TAB=$T(DK15+Z),LIG=$P(TAB,"";;"",2) Q:LIG=""""  X X1"
 S X0="ZL ""_SYSDEF.m"" F Z=0:1 S TAB=$T(DK15+Z),LIG=$P(TAB,"";;"",2) Q:LIG=""""  X X1"
 S X1="F W=1:1 S GLO=$P(LIG,"","",W) Q:GLO=""""  S @LISGLO@(GLO)="""""
 X X0
 Q
 
 
IN N FILE,RESLOAD,GLOPOCH,OBJ,LIB,%ILIB,%O,O
 D CLEPAG^%VVIDEO
 W !,$$^%QZCHW("Restauration de savoir-faire archive sur fichier"),!,!
 W !,!,!,$$^%QZCHW("Nom du fichier"),"  :  " R FILE G:FILE="" ENDIN
 S GLOPOCH=$$TEMP^%SGUTIL
 D LIREPOCH^TOGSSFRE(FILE,GLOPOCH)
 S O="" F %O=0:0 S O=$O(@GLOPOCH@(O)) Q:O=""  S LIB="" F %ILIB=0:0 S LIB=$O(@GLOPOCH@(O,LIB)) Q:LIB=""  D MSG^%VZEATT($$^%QZCHW("suppression de")_" "_LIB) S OBJ=O D ^TODELOBJ,OFF^%VZEATT
 D MSG^%VZEATT($$^%QZCHW("restauration"))
 S RESLOAD=$$GI^%SYSSAVE(FILE,QUI)
 I '(RESLOAD) D ^%VZEAVT($$^%QZCHW("Probleme lors de la restauration"))
ENDIN D CLEPAG^%VVIDEO
 Q
 ;

