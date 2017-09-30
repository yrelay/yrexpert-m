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

;%TLOB8^INT^1^59547,74030^0
%TLOB8 ;;06:09 PM  27 Apr 1993; ; 03 May 93  8:43 AM
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
TRIERL(IDEB,NBREG) N ATTRIB,ATT,ORD,INDX,LIE,I,J,R
 
 S J=1 F I=1:4 Q:I=NBREG  D TRIRATT S J=J+1
 S R=$$TRIERT^%QS0TRIE(V(IDEB),.ATTRIB)
 
 
 Q 1
TRIRATT S ORD=V(IDEB+I)
 S ATT=V((IDEB+I)+1)
 S INDX=V((IDEB+I)+2)
 S LIE=V((IDEB+I)+3)
 S ATTRIB(J)=ATT_"^"_ORD_"^"_INDX_"^"_LIE
 Q
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
NBJ(IDEB,NBREG) 
 N DAT,DAT2,REGI
 S DAT=$$GETINT(V(IDEB+2),V(IDEB),V(IDEB+4),0)
 S DAT2=$$GETINT(V(IDEB+7),V(IDEB+5),V(IDEB+9),0)
 S REGI=$S(NBREG<11:"STANDARD",V(IDEB+10)=$C(0):"STANDARD",V(IDEB+10)="":"STANDARD",1:V(IDEB+10))
 Q $$NBJ^%QMDRUTI(REGI,DAT,DAT2)
 
 
GETINT(REP,ATT,VAL,AVECH) 
 N RES,VALD
 I (ATT=$C(0))!(REP=$C(0)) S RES=$$^%QMDASAI(VAL,.VALD) G FGETI
 D:'($D(^[QUI]RQSDON("REMATDAT",REP,ATT))) SETREM^%QMDAUC(REP,ATT)
 I '(^[QUI]RQSDON("REMATDAT",REP,ATT)) S RES=$$^%QMDASAI(VAL,.VALD) G FGETI
 S VALD=$$INTF^%QMDAUC(REP,ATT,VAL)
FGETI Q:AVECH $P(VALD,"/") Q $P($P(VALD,"/"),",")
 
 
 
 
 
 
 
 
 
 
 
AJHDEL(IDEB,NBREG) 
 N DAT,AJH,REGI,REST
 S DAT=$$GETINT(V(IDEB+3),V(IDEB+1),V(IDEB+5),1)
 S REGI=V(IDEB),AJH=V(IDEB+6)
 S REST=$$AJHDEL^%QMDRUT2(REGI,DAT,AJH)
 Q $$^%QMDAFFI(REST,10002)
 
 
 
 
 
 
 
 
 
 
 
RETHDEL(IDEB,NBREG) 
 N DAT,AJH,REGI,REST
 S DAT=$$GETINT(V(IDEB+3),V(IDEB+1),V(IDEB+5),1)
 S REGI=V(IDEB),AJH=V(IDEB+6)
 S REST=$$RETHDEL^%QMDRUT2(REGI,DAT,AJH)
 Q $$^%QMDAFFI(REST,10002)
 
 
 
 
 
 
 
 
 
 
 
 
CONVPD(IDEB,NBREG) 
 N REGI,DATREF,PERI,SW,VAL
 S REGI=V(IDEB)
 S DATREF=$$GETINT(V(IDEB+3),V(IDEB+1),V(IDEB+5),1)
 S PERI=V(IDEB+6)
 S SW=$S(NBREG<8:1,V(IDEB+7)=$C(0):1,V(IDEB+7)="FIN":0,1:1)
 S VAL=$S(SW:$$DATEDEB^%QMDRUTP(REGI,DATREF,PERI),1:$$DATEFIN^%QMDRUTP(REGI,DATREF,PERI))
 Q $$^%QMDAFFI(VAL,10002)
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
CONVDP(IDEB,NBREG) 
 N REGI,DATREF,PERI,SW,VAL
 S REGI=V(IDEB),SW=V(IDEB+11)
 S DATREF=$$GETINT(V(IDEB+3),V(IDEB+1),V(IDEB+5),1)
 S DATGET=$$GETINT(V(IDEB+8),V(IDEB+6),V(IDEB+10),1)
 
 I SW=3 Q $$PREMPERI^%QMDRUTP(REGI,DATREF,$P(DATGET,",")_",0")
 I SW=2 Q $$PERUP^%QMDRUTP(REGI,DATREF,DATGET)
 Q $$PERDOWN^%QMDRUTP(REGI,DATREF,DATGET)
 
 
 
 
 
 
 
 
 
 
GETEQUIP(IDEB,NBREG) 
 N DAT,REGI,REST
 S DAT=$$GETINT(V(IDEB+3),V(IDEB+1),V(IDEB+5),1)
 S REGI=V(IDEB)
 S REST=$$GETEQUIP^%QMDRUTP(REGI,DAT,V(IDEB+6))
 Q REST

