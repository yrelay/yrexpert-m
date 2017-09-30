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

;%TLOPTF5^INT^1^59547,74030^0
%TLOPTF5 ;
 
 
 
 
 
 
 
 
 
 
CREESAIS(IDEB,NBREG) 
 N VAL,RES,CPT,MES
 
 S CPT=1
BCRSA I V(IDEB+CPT)=$C(O) G CRSAACT
 S VAL(CPT)=V(IDEB+CPT)
 S CPT=CPT+1
 G BCRSA
 
CRSAACT S RES=$$CREER^%SRTRANS(V(IDEB),.VAL,MODAF'=0,.MES)
 Q 1
 
 
 
 
 
 
 
 
 
 
 
 
 
 
DESSCENE(IDEB,NBREG) 
 N %PORT,%TERM,%DESSIN,%MOUV,X0,Y0,AGR
 I (V(IDEB+2)=$C(0))&(((V(IDEB+3)=$C(0))&V(IDEB+4))=$C(0)) S (X0,Y0,AGR)="" G FDES
 S X0=V(IDEB+2),Y0=V(IDEB+3)
 I V(IDEB+4)=$C(0) S AGR=1 G FDES
 S AGR=V(IDEB+4)
 
FDES 
 D INIT^%SDSCIMP(1)
 D TRAIT^%SDSCIMP(X0,Y0)
 S X0=$$CONV^%SDSCPT(X0)*10,Y0=$$CONV^%SDSCPT(Y0)*10
 D INIT5^%PBMFN(V(IDEB),V(IDEB+1),X0,Y0)
 D ^%SDSCACT(V(IDEB),V(IDEB+1),1,0,%PORT,%TERM,%DESSIN,AGR)
 D FIN^%SDSCIMP(1)
 K ^V($J,"%")
 D:MODAF ADD^%TLIFEN("LOG","   "_$$^%QZCHW("Fin de l'impression"))
 Q 1
 ;

