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

;%TLOB9^INT^1^59547,74030^0
%TLOB9 ;;09:02 AM  28 Mar 1992; ; 08 Sep 92  2:44 PM
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
DATET(IDEB,NBREG) 
 N ATT2,IND2,VAR2,REP2,ENT2,VALDAT,VALE
 I V(IDEB+7)=$C(0) S ATT2=V(IDEB),IND2=V(IDEB+1),VAR2=V(IDEB+3),REP2=V(IDEB+2) G SUIT
 S ATT2=V(IDEB+7),VAR2=V(IDEB+10),REP2=V(IDEB+9),IND2=V(IDEB+8)
SUIT S VALDAT=V(IDEB+4)
 S ENT1=V(IDEB+5)
 S ENT2=V(IDEB+6)
 I '($D(^RQSGLU("QMDA"))) D ^%QMDAINI
 S VALE=$$^%QMDAINT(VALDAT,ENT1)
 S VALE=$$^%QMDAFFI(VALE,ENT2)
 S RES=$$AFF^%TLOPT(REP2,VAR2,ATT2,IND2,VALE)
 Q 1
 
 
 
 
 
 
PRDSEMA(IDEB,NBREG) 
 Q $$ZA^%SYSSEMA(QUI,V(IDEB),V(IDEB+1))
 
 
 
 
 
RELSEMA(IDEB,NBREG) 
 D ZD^%SYSSEMA(QUI,V(IDEB))
 Q 1
 ;

