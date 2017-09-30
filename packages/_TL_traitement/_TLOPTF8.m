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

;%TLOPTF8^INT^1^59547,74030^0
%TLOPTF8 ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
TOTAL(IDEB,NBREG) 
 N L,TEMP,GLR,GVAL,NAR,IVAL,VAL,TYP,INO,%I
 N SUF,BASE,REP,AT
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMP)
 S GLR=$$CONCAS^%QZCHAD(TEMP,"RESULTAT")
 S GVAL=$$CONCAS^%QZCHAD(TEMP,"VALEUR")
 S L=V(IDEB+3)
 I V(IDEB+3)'="" G VALOS
 S L=LISTE
VALOS S BASE=$$^%QSCALVA("L0",L,"OBJET")
 S REP=$$NOMINT^%QSF(BASE)
 Q:REP="" 1
 S AT=V(IDEB)
 S SUF=""
 
BOUCLE S SUF=$$SUIVL^%QS0XG1(L,SUF) G:SUF="" FVALO
 K @(GVAL)
 D MVG^%QSCALVA(REP,SUF,AT,GVAL,.TYP)
 I @GVAL=0 G BOUCLE
 S INO="" F %I=1:1 S INO=$O(@GVAL@(INO)) Q:INO=""  S VAL=@GVAL@(INO) S:'($D(@GLR@(INO))) @GLR@(INO)="" S @GLR@(INO)=@GLR@(INO)+VAL
 G BOUCLE
FVALO S NAR=V(IDEB+1)
 S IVAL="" F %I=1:1 S IVAL=$O(@GLR@(IVAL)) Q:IVAL=""  D PA^%QSGESTI("L0",L,NAR,@GLR@(IVAL),IVAL)
FIN1 K @(TEMP)
 Q 1

