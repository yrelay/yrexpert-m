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

;%MZATTOP^INT^1^59547,73871^0
%MZATTOP ;
 
SAV(GC) 
 K ^SAVOP($J,GC) S K1="",TK=$$LISTIND^%QSGEST6($$OI^%MZQS)
LK1 S K1=$O(@TK@(K1)) G FIN:K1="",FIN:$P(K1,",",1)'=GC S K2=""
LK2 S K2=$O(@TK@(K1,K2)) G:K2="" LK1 S K3=""
LK3 S K3=$O(@TK@(K1,K2,K3)) G:K3="" LK2 S K4=""
LK4 S K4=$O(@TK@(K1,K2,K3,K4)) G:K4="" LK3
 S ^SAVOP($J,GC,K1,K2,K3,K4)="" G LK4
FIN K TK,K1,K2,K3,K4,K5 Q
 
RES(GC) 
 K ATKN S TK="^MOZ(""QUERY"",""STAND"")" F %U=1,2 I $D(@TK@(%U)) S K1=@TK@(%U) F %V=1:1 S K2=$P(K1,",",%V) Q:K2=""  S ATKN($P(K2,"^",1))=1
 S K5=$$LISTIND^%QSGEST6($$OI^%MZQS),TK="^SAVOP($J,GC)",K1=""
NK1 S K1=$O(@K5@(K1)) G FK:K1="",FK:$P(K1,",",1)'=GC,NK1:'($D(@TK@(K1))) S K2=""
NK2 S K2=$O(@TK@(K1,K2)) G NK1:K2="",NK1:$D(@K5@(K1,K2)),NK1:$D(ATKN(K2)) S K3=""
NK3 S K3=$O(@TK@(K1,K2,K3)) G:K3="" NK2 S K4=""
NK4 S K4=$O(@TK@(K1,K2,K3,K4)) G:K2="" NK3 D PA^%QSGESTI($$OI^%MZQS,K1,K2,K3,K4) G NK4
FK K ^SAVOP($J,GC) G FIN

