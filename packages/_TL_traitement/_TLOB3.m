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

;%TLOB3^INT^1^59547,74030^0
%TLOB3 ;;06:05 PM  2 Nov 1993; ; 02 Nov 93  6:06 PM
 
 
 
 
 
 
 
 
 
 
 
 
CHOISIR(IDEB,NBREG) 
 N POSX,POSY,VAL
 S POSX=$S(V(IDEB+3)="":10,1:V(IDEB+3))
 S POSY=$S(V(IDEB+4)="":10,1:V(IDEB+4))
 S VAL=$$CHOIX^%ANARB26(V(IDEB),V(IDEB+2),V(IDEB+1),V(IDEB+5),POSX,POSY)
 D:V(IDEB+2) CLEPAG^%VVIDEO
 Q VAL
 
 
 
MESSAGE(IDEB,NBREG) 
 N MS,VAL,CTR,DX,DY
 S MS=V(IDEB),VAL="",CTR=""
 D COLR^%VZEAVT(MS,0,79,0)
 D ^%VLECFL("","","","",DX,DY,"",.CTR,.VAL)
 Q VAL
 
 
 
 
 
 
 
 
 
 
 
 
DATE(IDEB,NBREG) 
 N FORM,DAT,FORD
 S (FORM,DAT,FORD)=""
 G:NBREG=0 DATAC G:V(IDEB)=$C(0) DATAC S FORM=V(IDEB)
 G:NBREG=1 DATAC G:V(IDEB+1)=$C(0) DATAC S DAT=V(IDEB+1)
 G:NBREG=2 DATAC G:V(IDEB+2)=$C(0) DATAC S FORD=V(IDEB+2)
DATAC Q $$DATET^%QMDATE2(FORM,DAT,FORD)
 
 
 
 
 
 
 
 
 
 
 
 
RECUP(IDEB,NBREG) 
 N II,IX
 S II="" F IX=1:1 S II=$$SUIVL^%QS0XG1(V(IDEB),II) Q:II=""  D PA^%QSGESTI(V(IDEB+2),V(IDEB+3),V(IDEB+1),II,IX)
 Q 1
 
 
 
 
 
 
 
 
 
 
 
 
SAISMUL(IDEB,NBREG) 
 N LIS,NOMSM,TITRE,MUET
 
 S NOMSM=V(IDEB)
 S LIS=V(IDEB+1)
 S TITRE=$S(V(IDEB+2)=$C(0):"",1:V(IDEB+2))
 S MUET=$S(V(IDEB+3)=$C(0):0,1:V(IDEB+3))
 D SAIS
 Q 1
 
SAIS N PARCO,PAREXE,V,DEROUT,NATERR
 D ACTIV^%QUBKKA(NOMSM_$C(0)_$C(0)_LIS_$C(0)_$C(0)_TITRE,MUET,1)
 Q
 ;

