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
;! Nomprog     :                                                              !
;! Module      :                                                              !
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

;%TLOB10^INT^1^59547,74030^0
%TLOB10 ;;11:47 AM  12 May 1992;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
CRACT(IDEB,NBREG) 
 N NUM,ACT,GAM,GE,GI,OE,OI,LIEN,LIS,NOMO,VVAR,MSG,LLIS
 S LLIS=$$TEMP^%SGUTIL
 S VVAR=V(IDEB),NUM=V(IDEB+5),ACT=V(IDEB+6)
 S GAM=V(IDEB+7),GI=V(IDEB+8)
 S GE=$$NOMLOG^%QSF(GI)
 S OE=^TABIDENT(WHOIS,"MOZART",GE,"OE")
 S OI=$$NOMINT^%QSF(OE)
 S LIEN=$$LIEN1^%QSGEL2(GI,OI,2)
 
 S NOMO=""
BNOMO S NOMO=$$NXTRIAO^%QSTRUC8(GI,GAM,LIEN,NOMO)
 G:NOMO="" BNOMF
 S @LLIS@(NOMO)=""
 G BNOMO
BNOMF S NOMO=NUM_".999"
 S NOMO=$ZP(@LLIS@(NOMO))
 I NOMO="" S NUM=NUM_".001" G GENOP
 I $P(NOMO,".")'=NUM S NUM=NUM_".001" G GENOP
 S NOMO=$P(NOMO,".",2),LNOMO=$L(NOMO),NOMO=NOMO+2
 S NOMO=$$ZSUBST^%QZCHSUB($J(NOMO,LNOMO)," ","0")
 S NUM=NUM_"."_NOMO
GENOP 
 S NOMO=GAM_","_ACT_"/"_NUM
 D ADDO^%QSGEST3(GI,GAM,NUM,LIEN,OI,ACT_"/"_NUM)
 D PA^%QSGESTI(OI,NOMO,"NOM",ACT_"/"_NUM,1)
 D PA^%QSGESTI(OI,NOMO,"NUMERO.OPERATION",NUM\1,1)
 D PA^%QSGESTI(OI,NOMO,"ACTION",ACT,1)
 S RES=$$AJCXT^%TLOPT(VVAR,OI,NOMO)
 K @(LLIS)
 Q 1
 ;

