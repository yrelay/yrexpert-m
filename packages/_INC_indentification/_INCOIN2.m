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

;%INCOIN2^INT^1^59547,73870^0
%INCOIN2 ;;09:41 AM  6 Sep 1993; 01 Jul 93  6:38 PM ; 08 Sep 93 10:00 AM
 
 
NOKOBJ(TYPE,OBJ) 
 I $D(^[QUI]INCONNE("MOD"))#10 Q:^[QUI]INCONNE("MOD")=0 1
 S PRF="" F %P=0:0 S PRF=$O(^[QUI]INCONNE("MOD",PRF)) Q:PRF=""  I $F(OBJ,PRF)=($L(PRF)+1) G:^[QUI]INCONNE("MOD",PRF)=0 NOK G OK
OK Q 0
NOK Q 1
 
 
OKCODE(CODE) N L
 Q:CODE="" 0
 S L=$S($D(^INCONNE("LAST")):^INCONNE("LAST"),1:0)
 Q:CODE'>L 0
 Q:CODE#29 0
 S ^INCONNE("LAST")=CODE
 Q 1
 
PROLREST(GCODE) 
 D COPY^%QCAGLC("^[QUI]INCONNE(""MOD"")",GCODE)
 K ^[QUI]INCONNE("MOD")
 Q
 
EPILREST(GCODE) 
 D COPY^%QCAGLC(GCODE,"^[QUI]INCONNE(""MOD"")")
 Q
 
CODE() N NUM,R S NUM=$H,NUM=$P(NUM,",")_$P(NUM,",",2)
 S R=NUM#29 Q:'(R) NUM
 S NUM=(NUM+29)-R
 Q NUM
 
 
AUTORALL 
 N MDP
 W !,"mot de passe ? :"
 R MDP
 Q:MDP'=$$LIM(QUI,"*")
 W "  ok "
 K ^[QUI]INCONNE("MOD")
 Q
 
AUTOR(PREF) 
 N MDP
 W !,"mot de passe ? :"
 R MDP
 Q:MDP'=$$LIM(QUI,PREF)
 W "  ok "
 S ^[QUI]INCONNE("MOD",PREF)=1
 Q
 
DEF S ^[QUI]INCONNE("MOD","DGI")=0
 S ^[QUI]INCONNE("MOD","YXP")=0
 S ^[QUI]INCONNE("MOD","TXP")=0
 Q
 
LIM(PAR,PRF) 
 N C,L
 S C=$$MDP^%VACTLIM
 F L=1:1:$L(PAR) S C=C+$A($E(PAR,L))
 F L=1:1:$L(PRF) S C=C+$A($E(PRF,L))
 Q C

