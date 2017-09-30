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

;%QSGES20^INT^1^59547,73881^0
%QSGES20 ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
CREERLS(REP1,OB1,ORD1,L,REP2,OB2) 
 Q:'($$QUAL^%QSGEL2(REP1,L))
 N PREMCL,REPL1,REPL2
 S PREMCL=$P(L,".")
 
 Q:(((PREMCL="LIEN")!(PREMCL="INVERSE"))!(PREMCL="SOURCE"))!(PREMCL="DESTINATION")
 Q:($$NOMEX^%QSGES10(REP1,OB1)="")!($$NOMEX^%QSGES10(REP2,OB2)="")
 N NOML,LIENI S NOML=$$NOML(OB1,ORD1,L,OB2)
 Q:NOML=""
 S REPL1=$$NOMLOG^%QSF(REP1)
 S REPL2=$$NOMLOG^%QSF(REP2)
 S LIENI=$$LIENI^%QSGEL3
 D SX^%QSGESTK(LIENI,NOML)
 D PA^%QSGESTI(LIENI,NOML,"REP.SOURCE",REPL1,1)
 D PA^%QSGESTI(LIENI,NOML,"REP.DESTINATION",REPL2,1)
 D PA^%QSGESTI(LIENI,NOML,"NUMERO.ORDRE",ORD1,1)
 D PA^%QSGESTI(LIENI,NOML,"NOM.LIEN",L,1)
 D PA^%QSGESTI(LIENI,NOML,"NOM",NOML,1)
 D ADDS^%QSGEST3(REP1,OB1,"LIEN."_L,LIENI,NOML)
 D ADDS^%QSGEST3(LIENI,NOML,"DESTINATION."_L,REP2,OB2)
 Q
 
 
 
 
 
 
 
 
 
 
 
 
SUPPLS(REP1,OB1,ORD1,L,REP2,OB2) 
 N PREMCL
 S PREMCL=$P(L,".")
 Q:(((PREMCL="LIEN")!(PREMCL="INVERSE"))!(PREMCL="SOURCE"))!(PREMCL="DESTINATION")
 Q:'($$QUAL^%QSGEL2(REP1,L))
 Q:($$NOMEX^%QSGES10(REP1,OB1)="")!($$NOMEX^%QSGES10(REP2,OB2)="")
 N NOML,REPL1,REPL2,LIENI
 S REPL1=$$NOMLOG^%QSF(REP1) Q:REPL1=""
 S REPL2=$$NOMLOG^%QSF(REP2) Q:REPL2=""
 S LIENI=$$LIENI^%QSGEL3
 S NOML=$$NOML(OB1,ORD1,L,OB2)
 D SX^%QSGESTK(LIENI,NOML)
 D SUPNOM(OB1,ORD1,L,OB2)
 Q
 
 
 
 
 
 
 
 
 
 
 
 
CREERL(REP1,OB1,ORD1,L,REP2,OB2) 
 N LIENIL
 Q:$P(L,".")="LIEN"
 G:'($$QUAL^%QSGEL2(REP1,L)) SUITL
 D CREERLS(REP1,OB1,ORD1,L,REP2,OB2)
SUITL S LIENIL=$$LIENI^%QSGEL2(REP1,REP2,L,$$TYPE^%QSGEST9(REP1,L))
 Q:LIENIL=""
 Q:'($$QUAL^%QSGEL2(REP2,LIENIL))
 N T,ORD2
 S ORD2=OB1
 
 I $$TYPE^%QSGEST9(REP1,L)=2 S ORD2=1
 D CREERLS(REP2,OB2,ORD2,LIENIL,REP1,OB1)
 Q
 
 
 
 
 
 
 
 
 
 
 
 
SUPPL(REP1,OB1,ORD1,L,REP2,OB2) 
 Q:$P(L,".")="LIEN"
 N LIENIL
 G:'($$QUAL^%QSGEL2(REP1,L)) SUITS
 D SUPPLS(REP1,OB1,ORD1,L,REP2,OB2)
SUITS S LIENIL=$$LIENI^%QSGEL2(REP1,REP2,L,$$TYPE^%QSGEST9(REP1,L))
 Q:LIENIL=""
 Q:'($$QUAL^%QSGEL2(REP2,LIENIL))
 N T,ORD2
 S ORD2=OB1
 
 I $$TYPE^%QSGEST9(REP1,L)=2 S ORD2=1
 D SUPPLS(REP2,OB2,ORD2,LIENIL,REP1,OB1)
 Q
 
 
 
 
 
 
 
 
 
 
 
NOML(OB1,ORD1,L,OB2) 
 N NL,TLIEN
 I WHOIS("ETUDE")'=0 Q $$NOMLE("A")
 S TLIEN=$$TLIEN^%QSGES21
 
 Q:$D(@TLIEN@(L,OB1,OB2,ORD1)) @TLIEN@(L,OB1,OB2,ORD1)
 I '($D(@TLIEN@(L))) S @TLIEN@(L)=0
 S @TLIEN@(L)=@TLIEN@(L)+1
 S NL=L_"\"_@TLIEN@(L)
 S @TLIEN@(L,OB1,OB2,ORD1)=NL
 Q NL
NOMLE(MODE) 
 N R1,R2,NL,TLIEN,V,RLIEN,A,%A
 D LIENR^%QSGEL2(L,.R1,.R2)
 S V=$$^%QSCALVA(R1,OB1,"LIEN."_L) I V="" G POP
 S RLIEN=$$LIENI^%QSGEL3
 S A="" F %A=0:0 S A=$$NXTRIAO^%QSTRUC8(R1,OB1,"LIEN."_L,A) G:A="" POP I $$^%QSCALIN(RLIEN,A,"DESTINATION."_L,OB2)=OB2 G NOMLER
NOMLER Q A
POP I MODE="C" Q ""
 S V=$$PULLVAL^%QXPPRI7(WHOIS("ETUDE"),WHOIS("NDCOUR"),"NUMEROS.DE.LIENS",L)+1
 D PUSHVAL^%QXPPRI7(WHOIS("ETUDE"),WHOIS("NDCOUR"),"NUMEROS.DE.LIENS",L,V)
 Q L_"\"_V
 
 
 
 
 
 
 
 
 
 
 
 
 
NOML1(OB1,ORD1,L,OB2) 
 Q:(((L="")&(OB1=""))&(OB2=""))&(ORD1="") ""
 N TLIEN,R1,R2
 I WHOIS("ETUDE")'=0 Q $$NOMLE("C")
 S TLIEN=$$TLIEN^%QSGES21
 Q:'($$KEYLGTH^%SYSUTI1($L(TLIEN),$L(L),$L(OB1),$L(OB2),$L(ORD1))) ""
 I ($D(@TLIEN@(L,OB1,OB2,ORD1))#10)=1 S TLIEN=@TLIEN@(L,OB1,OB2,ORD1) Q TLIEN
 Q ""
 
 
 
 
 
 
 
 
 
SUPNOM(OB1,ORD1,L,OB2) 
 N TLIEN
 Q:WHOIS("ETUDE")'=0
 S TLIEN=$$TLIEN^%QSGES21
 Q:'($$KEYLGTH^%SYSUTI1($L(TLIEN),$L(L),$L(OB1),$L(OB2),$L(ORD1)))
 K @TLIEN@(L,OB1,OB2,ORD1)
 Q

