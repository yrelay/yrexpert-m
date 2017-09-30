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

;%MZINIT^INT^1^59547,73872^0
MOZINIT ;
 
 G:$D(^MOZIDF($I,WHOIS)) SUIT D REP
SUIT K ^RELIT($J)
 F %U=1,2 G:('($D(^MOZ(WHOIS,"C","L",%U))))&('($D(^MOZ("C","L",%U)))) END
 Q:('($D(^MOZ(WHOIS,"C","PARA"))))&('($D(^MOZ("STAND","C","PARA"))))  K REL,LIS S LIT=$S($D(^MOZ(WHOIS,"C","PARA")):^MOZ(WHOIS,"C","PARA"),1:^MOZ("STAND","C","PARA")),OK=1,NI=0 F %U=1:1 S IT=$P(LIT,",",%U) Q:IT=""  S NI=NI+1,LIS(NI)=IT
 S %W1=NI-1 F %U=1:1:%W1 S IT1=LIS(%U),%W2=%U+1 F %V=%W2:1:NI S IT2=LIS(%V),^RELIT($J,0,IT1,IT1_"."_IT2)=1,^RELIT($J,0,IT2,IT1_"."_IT2)=1
 F %U=1,2 S TAB=$S($D(^MOZ(WHOIS,"C","L",%U)):^MOZ(WHOIS,"C","L",%U),1:^MOZ("C","L",%U)) F %V=1:1 S %W1=$P(TAB,"/",%V) Q:%W1=""  S %W2=$P(%W1,",",2),%W1=$P(%W1,",",1) S:$D(^RELIT($J,0,%W1)) ^RELIT($J,%U,%W2,%W1)=1
END K REL,LIS,%W1,%W2,%U,%V,IT1,IT2,NI Q
REP Q:$D(^MOZIDF($I,WHOIS))>1
 D CPT^%MZREP I CPT=0 D AFF^%MZREP("GAMME","MOZ","OPERATION.MOZART","MOZOP") Q
 S NG=$O(^TABIDENT(WHOIS,"MOZART","")) D GET^%MZREP Q
CONNECT(IDF) 
 D AFF(IDF,$$VAL)
 Q
KILL(IDF) K ^[QUI]MOZGARDE(IDF) Q
VAL() N I,J,K,S,G S S="MOZGARDE",J=^%SCRE(S),K=""
 F I=2:1:J S K=K_$S($D(^%SCRE(S,I,"QUERY")):$C(26),1:"")_"^"
 Q K
FEXTER S ^TTLEXTER("DETRUIRE.GAMME")="INT^%MZQKG|0" Q
AFF(I,V) 
 S ^[QUI]MOZGARDE(I)=V Q

