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

;%AMFIND^INT^1^59547,73865^0
%AMFIND ;;03:51 PM  6 Aug 1993
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
FIND(ETU,INST,NJRN,NINST,TYPE,profondeur,NBKEY,KEY1,KEY2,KEY3,KEY4,KEY5,KEY6) 
 N NINST2,NINST3,A
 N JRN
 S JRN=ETU,NINST=INST
 
 G:TYPE="" FIND2
AGA 
 
 
 S:NBKEY=1 NINST2=$ZP(@GEXEC@(TYPE,KEY1,NINST))
 S:NBKEY=2 NINST2=$ZP(@GEXEC@(TYPE,KEY1,KEY2,NINST))
 S:NBKEY=3 NINST2=$ZP(@GEXEC@(TYPE,KEY1,KEY2,KEY3,NINST))
 S:NBKEY=4 NINST2=$ZP(@GEXEC@(TYPE,KEY1,KEY2,KEY3,KEY4,NINST))
 S:NBKEY=5 NINST2=$ZP(@GEXEC@(TYPE,KEY1,KEY2,KEY3,KEY4,KEY5,NINST))
 S:NBKEY=6 NINST2=$ZP(@GEXEC@(TYPE,KEY1,KEY2,KEY3,KEY4,KEY5,KEY6,NINST))
 S:NINST2="" NINST2=-1
 
 S NINST3=$ZP(@DEFETU@("fille",NINST)) S:NINST3="" NINST3=-1
 S:profondeur'="OUI" NINST3=-1
 
 I NINST3>NINST2 S JRN=@DEFETU@("fille",NINST3,1),NINST="" G AGA
 
 I NINST2'=-1 S NINST=NINST2 G TROUVE
 
 
 I '($D(@DEFETU@("pere"))) G ECHEC
 S NETU=@DEFETU@("pere")
 S NINST=$P(NETU,"^",2),JRN=$P(NETU,"^")
 G AGA
 
 
ECHEC S NJRN="",NINST="" Q 0
 
TROUVE S NJRN=JRN
 Q 1
 
 
FIND2 
 G:profondeur'="OUI" FFU0
 I $D(@DEFETU@("fille",NINST-1,1)) S JRN=@DEFETU@("fille",NINST-1,1),NINST=$ZP(@GJOURN@("")) G TROUVE
FFU0 S NINST=$ZP(@GJOURN@(NINST)) G:NINST'="" TROUVE
 I '($D(@DEFETU@("pere"))) G ECHEC
 S NETU=@DEFETU@("pere")
 S NINST=$P(NETU,"^",2),JRN=$P(NETU,"^")
 G TROUVE
 
 
NEXT(JRN,INST,NJRN,NINST,TYPE,profondeur,NBKEY,KEY1,KEY2,KEY3,KEY4,KEY5,KEY6) 
 
 S NINST=INST
 
 G:TYPE="" NEXT2
AGAN 
 
 
 S:NBKEY=1 NINST2=$O(@GEXEC@(TYPE,KEY1,NINST))
 S:NBKEY=2 NINST2=$O(@GEXEC@(TYPE,KEY1,KEY2,NINST))
 S:NBKEY=3 NINST2=$O(@GEXEC@(TYPE,KEY1,KEY2,KEY3,NINST))
 S:NBKEY=4 NINST2=$O(@GEXEC@(TYPE,KEY1,KEY2,KEY3,KEY4,NINST))
 S:NBKEY=5 NINST2=$O(@GEXEC@(TYPE,KEY1,KEY2,KEY3,KEY4,KEY5,NINST))
 S:NBKEY=6 NINST2=$O(@GEXEC@(TYPE,KEY1,KEY2,KEY3,KEY4,KEY5,KEY6,NINST))
 S:NINST2="" NINST2=-1
 
 I $D(@DEFETU@("fille",NINST)) S NINST3=NINST G N2
 S NINST3=$O(@DEFETU@("fille",NINST)) S:NINST3="" NINST3=-1
N2 S:profondeur'="OUI" NINST3=-1
 
 
 I NINST3'=-1,(NINST3<NINST2)!(NINST2=-1) S JRN=@DEFETU@("fille",NINST3,1),NINST=-1 G AGAN
 
 I NINST2'=-1 S NINST=NINST2 G TROUVE
 
 
 I '($D(@DEFETU@("pere"))) G ECHEC
 S NETU=@DEFETU@("pere"),NINST=$P(NETU,"^",2)+1,JRN=$P(NETU,"^") G AGAN
 
 
 
NEXT2 I profondeur'="OUI" G FFNX1
 I $D(@DEFETU@("fille",NINST)) S JRN=@DEFETU@("fille",NINST,1),NINST=$O(@GJOURN@("")) G TROUVE
FFNX1 S NINST=$O(@GJOURN@(NINST)) G:NINST'="" TROUVE
 I '($D(@DEFETU@("pere"))) G ECHEC
 S NETU=@DEFETU@("pere")
 S NINST=$P(NETU,"^",2)+1,JRN=$P(NETU,"^")
 G TROUVE
 ;
 ;

