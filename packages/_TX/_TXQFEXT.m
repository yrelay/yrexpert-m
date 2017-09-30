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

;%TXQFEXT^INT^1^59547,74033^0
%TXQFEXT ;;10:58 AM  15 Apr 1993 ; 15 Apr 93  4:32 PM
 
 
 
 N SOMMET,ARC,REP,LIEN,IND,ORD,LIE,NUM,%O,NOMLIEN,REPLIEN,ATTFLUX,VAL,ATTAF
 S REP=$$NOMINT^%QSF("STATION.DE.PRODUCTION"),LIEN="TIRE",ATTFLUX="FLUX"
 S VU=$$TEMP^%SGUTIL
 S SOMMET=$$TEMP^%SGUTIL,ARC=$$TEMP^%SGUTIL
 S REPLIEN=$$LIENI^%QSGEL3
 S IND="",NBSOM=0
NXIND S IND=$$NXTRI^%QSTRUC8(REP,IND) G:IND="" FINMK
 D:'($D(@VU@(IND))) INDIV(IND) S IIND=@VU@(IND)
I20 S NUM=@VU@(IND),ORD=""
NXO S ORD=$$NXTRIAO^%QSTRUC8(REP,IND,LIEN,ORD) G:ORD="" NXIND
 S LIE=$$VALEUR^%QSTRUC8(REP,IND,LIEN,ORD)
 D:'($D(@VU@(LIE))) INDIV(LIE) S ILIE=@VU@(LIE)
 S NOMLIEN=$$NOML1^%QSGES20(IND,ORD,LIEN,LIE),VAL=$$^%QSCALIN(REPLIEN,NOMLIEN,ATTFLUX,1)
 I (VAL+0)>0 S @ARC@(IIND,ILIE)=VAL
 G NXO
FINMK 
 S @SOMMET@("AUTRES.INFOS","Nombre de Sommets")=NBSOM
 S @SOMMET@("AUTRES.INFOS","Longueur.Totale")=$$^%QSCALIN("CONSTANTES","DESCRIPTION.USINE","LONGUEUR.TOTALE",1)
 S @SOMMET@("AUTRES.INFOS","Largeur.Totale")=$$^%QSCALIN("CONSTANTES","DESCRIPTION.USINE","LARGEUR.TOTALE",1)
 
 
 
 
 F IIND=1:1:NBSOM S IND=@SOMMET@(IIND) D AFFRES
 K @(SOMMET),@(ARC),@(VU)
 Q
AFFRES D:$D(@SOMMET@(IIND,"POS.X")) PA^%QSGESTI(REP,IND,"ABSCISSE",@SOMMET@(IIND,"POS.X"),"OPTIMISEE")
 D:$D(@SOMMET@(IIND,"POS.Y")) PA^%QSGESTI(REP,IND,"ORDONNEE",@SOMMET@(IIND,"POS.Y"),"OPTIMISEE")
 Q
INDIV(IND) 
 S NBSOM=NBSOM+1
 S @VU@(IND)=NBSOM
 S @SOMMET@(NBSOM)=IND
 S @SOMMET@(NBSOM,"LO")=$$^%QSCALIN(REP,IND,"ENCOMBREMENT.X",1)
 S @SOMMET@(NBSOM,"LA")=$$^%QSCALIN(REP,IND,"ENCOMBREMENT.Y",1)
 Q

