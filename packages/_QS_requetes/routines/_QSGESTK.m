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

;%QSGESTK^INT^1^59547,73882^0
%QSGESTK ;;11:34 AM  6 May 1992; ; 19 Apr 93  7:32 PM
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
SX(%U7,%CUK) 
 I WHOIS("ETUDE")'=0 D SX^%QXPGESK(%U7,%CUK) Q
 N A,%A,V,M,R,ORIGINE,NG,TEMP,PILIND,IPILI,ICOUR,TLI,BASED,FILS,ORD
 N TLIEN,LIEN,BASE,IND,%UP,%IU7,%V,%UV,%UVV,%UN,%UNN,ATT,QUAL,QUALI
 N ORDPF,%O
 Q:(%U7="")!(%CUK="")
 
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"T") K @(TEMP)
 S PILIND=$$CONCAS^%QZCHAD(TEMP,"I")
 S TLIEN=$$TLIEN^%QSGES21
 S IPILI=0,@PILIND@(0,"B")=%U7,@PILIND@(0,"I")=%CUK
 S ICOUR=""
BCLINDI S ICOUR=$O(@PILIND@(ICOUR)) Q:ICOUR=""
 S BASE=@PILIND@(ICOUR,"B"),IND=@PILIND@(ICOUR,"I")
 S LIEN="" F %A=0:0 S LIEN=$$NXTRIA^%QSTRUC8(BASE,IND,LIEN) Q:LIEN=""  I $D(^[QUI]RQSLIEN(BASE,LIEN)) S %IU7=^[QUI]RQSLIEN(BASE,LIEN) D TRTL
 
 
 S %UP=""
BCLKA S %UP=$O(^[QUI]QUERYV(BASE,IND,%UP)) G:%UP="" UCONT D PSV^%QSGESTI(BASE,IND,%UP) G BCLKA
UCONT I '($D(^[QUI]RQSDON("REMSIG",BASE))) D SETREM(BASE)
 I ^[QUI]RQSDON("REMSIG",BASE),BASE'="%" S M=$$MODEL^%QSMODEL I M'="" S NG=$$NOMLOG^%QSF(BASE),R=$S(NG="":"",1:$$^%QCAZG("^[QUI]RQSMOD5(M,NG)")) I R'="" S ORIGINE="SX" D @("^"_$P(R,"^",1)_"("""_BASE_""","""_%CUK_""")")
 G BCLINDI
 
SETREM(BA) 
 S ^[QUI]RQSDON("REMSIG",BA)=0
 I BASE'="%" S M=$$MODEL^%QSMODEL I M'="" S NG=$$NOMLOG^%QSF(BASE),R=$S(NG="":"",1:$$^%QCAZG("^[QUI]RQSMOD5(M,NG)")) I R'="" S ^[QUI]RQSDON("REMSIG",BA)=1
 Q
 
TRTL S TLI=$P(%IU7,"^",1),BASED=$P(%IU7,"^",2),ATT=$P(^[QUI]RQSILIEN(BASE,BASED,TLI,LIEN),"^",2),QUAL=$$QUAL^%QSGEL2(BASE,LIEN),QUALI=$$QUAL^%QSGEL2(BASED,ATT)
 
 S ORD="" F %V=0:0 S ORD=$$NXTRIAO^%QSTRUC8(BASE,IND,LIEN,ORD) Q:ORD=""  S V=$$VALEUR^%QSTRUC8(BASE,IND,LIEN,ORD) D @("TRTL"_TLI)
 Q
 
TRTL0 Q
 
TRTL1 S FILS=$P(IND,",",$L(IND,","))
 
 S ORDPF="" F %O=0:0 S ORDPF=$$NXTRIAO^%QSTRUC8(BASED,V,ATT,ORDPF) Q:ORDPF=""  Q:$$VALEUR^%QSTRUC8(BASED,V,ATT,ORDPF)=FILS
 Q:ORDPF=""
 D PS^%QSGESTI(BASED,V,ATT,FILS,ORDPF)
 D:QUAL SUPPLS(BASE,IND,1,LIEN,BASED,V)
 D:QUALI SUPPLS(BASED,V,ORD,LIEN,BASED,IND)
 Q
 
TRTL2 S FILS=IND_","_V,IPILI=IPILI+1
 S @PILIND@(IPILI,"B")=BASED,@PILIND@(IPILI,"I")=FILS
 D PS^%QSGESTI(BASED,FILS,ATT,IND,1)
 D:QUAL SUPPLS(BASE,IND,ORD,LIEN,BASED,FILS)
 D:QUALI SUPPLS(BASED,FILS,1,ATT,BASE,IND)
 Q
 
TRTL3 
TRTL4 
TRTL5 D PS^%QSGESTI(BASED,V,ATT,IND,IND)
 D:QUAL SUPPLS(BASE,IND,V,LIEN,BASED,V)
 D:QUALI SUPPLS(BASED,V,IND,ATT,BASE,IND)
 Q
 
 
 
 
 
 
 
 
 
 
 
 
 
SUPPLS(REP1,OB1,ORD1,L,REP2,OB2) 
 
 Q:(((REP1="")!(OB1=""))!(OB2=""))!(ORD1="")
 G:WHOIS("ETUDE")'=0 SUPPLSE
 I '($$KEYLGTH^%SYSUTI1($L(TLIEN),$L(L),$L(OB1),$L(OB2),$L(ORD1))) Q
 I ($D(@TLIEN@(L,OB1,OB2,ORD1))#10)'=1 Q
 S IPILI=IPILI+1
 S @PILIND@(IPILI,"B")=$$LIENI^%QSGEL3,@PILIND@(IPILI,"I")=@TLIEN@(L,OB1,OB2,ORD1)
 K @TLIEN@(L,OB1,OB2,ORD1)
 Q
 
SUPPLSE 
 N NL
 S NL=$$NOML1^%QSGES20(OB1,ORD1,L,OB2) Q:NL=""
 S IPILI=IPILI+1
 S @PILIND@(IPILI,"B")=$$LIENI^%QSGEL3,@PILIND@(IPILI,"I")=NL
 Q
 
 
 
SXSPEED(%U7,%CUK) 
 N %UP,%UV,%UN
 I WHOIS("ETUDE")'=0 D SX^%QXPGES2(WHOIS("ETUDE"),%U7,%CUK) Q
 Q:$D(^[QUI]QUERYV(%U7,%CUK))<10
 S %UP=""
SPEED2 S %UP=$O(^[QUI]QUERYV(%U7,%CUK,%UP)) I %UP="" S ^[QUI]QUERYV(%U7)=$S($D(^[QUI]QUERYV(%U7))<9:0,1:^[QUI]QUERYV(%U7)-1) Q
 S %UN=""
SPEED3 S %UN=$O(^[QUI]QUERYV(%U7,%CUK,%UP,%UN)) G:%UN="" SPEED2
 S %UV=^[QUI]QUERYV(%U7,%CUK,%UP,%UN) K ^[QUI]QUERYV(%U7,%CUK,%UP,%UN),^[QUI]QUERY2(%U7,%UP,%UV,%UN,%CUK),^[QUI]QUERY3(%U7,%CUK,%UN,%UP,%UV),^[QUI]QUERY4(%U7,%UV,%UP,%UN,%CUK)
 G SPEED3
 
 
 
 
 
 
SXLIEN(BASE,IND,LIEN,R1,I1,R2,I2) 
 N M,R,ORIGINE,%UP,%IU7,%V,%UV,%UVV,%UN,%UNN,DEMLI,DEMLI2
 
 S DEMLI="LIEN."_LIEN
 D PS^%QSGESTI(R1,I1,DEMLI,NOML,NOML)
 
 S DEMLI2=$P(^[QUI]RQSILIEN(BASE,R2,3,"DESTINATION."_LIEN),"^",2)
 D PS^%QSGESTI(R2,I2,DEMLI2,NOML,NOML)
 S %UP=""
BCLKA2 S %UP=$O(^[QUI]QUERYV(BASE,IND,%UP)) G:%UP="" UCONT2 D PSV^%QSGESTI(BASE,IND,%UP) G BCLKA2
UCONT2 I '($D(^[QUI]RQSDON("REMSIG",BASE))) D SETREM(BASE)
 I ^[QUI]RQSDON("REMSIG",BASE),BASE'="%" S M=$$MODEL^%QSMODEL I M'="" S NG=$$NOMLOG^%QSF(BASE),R=$S(NG="":"",1:$$^%QCAZG("^[QUI]RQSMOD5(M,NG)")) I R'="" S ORIGINE="SX" D @("^"_$P(R,"^",1)_"("""_BASE_""","""_IND_""")")
 Q
 ;
 ;

