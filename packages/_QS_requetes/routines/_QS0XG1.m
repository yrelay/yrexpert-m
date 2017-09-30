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

;%QS0XG1^INT^1^59572,35190^0
%QS0XG1 ;;11:15 AM  30 Sep 1993; ; 30 Sep 93 11:22 AM
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
AJOUT(LIS,IND) 
 N ADR,CARD,ADRT,INX
 Q:LIS=""  Q:IND=""
 I WHOIS("ETUDE")'=0 G AJOUTEI
 S ADR=$$^%QSCALIN("L0",LIS,"ADRESSE",1) Q:$D(@ADR@(IND))
 S @ADR@(IND)="",CARD=$$^%QSCALIN("L0",LIS,"CARD",1)+1
 I $$OAIR^%QSGE5("L0",LIS,"TRIEE",1) S ADRT=$$^%QSCALIN("L0",LIS,"TRIEE",1),INX=$ZP(@ADRT@(""))+1,@ADRT@(INX)=IND,@ADR@(IND)=INX
 D PA^%QSGESTI("L0",LIS,"CARD",CARD,1)
 D PA^%QSGESTI("L0",LIS,"DATE.UTILISATION",$$31^%QMDATE1($$DATENO2^%QMDATE($H)),1),PA^%QSGESTI("L0",LIS,"HEURE.UTILISATION",$$HEUREX^%QMDATE($H),1)
 Q
 
AJOUTE(LIS,IND) 
 Q:LIS=""  Q:IND=""
 N ADR,CARD,ADRT
AJOUTEI 
 N REFL,REP,LAST,ORD
 S REFL=$$REFL^%QXPGESD(WHOIS("ETUDE"),LIS) Q:REFL=""
 S ORD=$$PULLMAT2^%QXPPRI7(WHOIS("ETUDE"),WHOIS("NDCOUR"),"LISTE",REFL,IND) I ORD'="" Q:$$PULLMAT2^%QXPPRI7(WHOIS("ETUDE"),WHOIS("NDCOUR"),"LISTE.TRIEE",REFL,ORD)=IND
 S CARD=$$CALIN^%QXPGES2(WHOIS("ETUDE"),"L0",LIS,"CARD",1)
 S LAST=$$PULLVAL^%QXPPRI7(WHOIS("ETUDE"),WHOIS("NDCOUR"),"DERNIER.OCCUPE",LIS)+1
 D PUSHMAT2^%QXPPRI7(WHOIS("ETUDE"),WHOIS("NDCOUR"),"LISTE",REFL,IND,LAST)
 D PUSHMAT2^%QXPPRI7(WHOIS("ETUDE"),WHOIS("NDCOUR"),"LISTE.TRIEE",REFL,LAST,IND)
 D PUSHVAL^%QXPPRI7(WHOIS("ETUDE"),WHOIS("NDCOUR"),"DERNIER.OCCUPE",LIS,LAST)
 D PA2^%QXPGES2(WHOIS("ETUDE"),"L0",LIS,REFL,"CARD",CARD+1,1)
 Q
 
 
RETIRL(LIS,IND) 
 Q:LIS=""  Q:IND=""
 I WHOIS("ETUDE")'=0 G RETIRLEI
 N ADR,ADRT,CARD,L,%I,%J
 S L=LIS
 S ADR=$$ADRLIS^%QSGEST7(L),ADRT=$$ADRLT^%QSGEST7(L)
 K @ADR@(IND) S CARD=$$^%QSCALVA("L0",L,"CARD")-1
 I ADRT'="" S %J="" F %I=1:1 S %J=$O(@ADRT@(%J)) Q:%J=""  I @ADRT@(%J)=IND K @ADRT@(%J) Q
 D PA^%QSGESTI("L0",L,"CARD",CARD,1),PA^%QSGESTI("L0",L,"DATE.UTILISATION",$$31^%QMDATE1($$DATENO2^%QMDATE($H)),1),PA^%QSGESTI("L0",L,"HEURE.UTILISATION",$$HEUREX^%QMDATE($H),1)
 Q
RETIRLE(LIS,IND) 
 Q:LIS=""  Q:IND=""
RETIRLEI 
 N REFL,CARD,ORD
 S REFL=$$REFL^%QXPGESD(WHOIS("ETUDE"),LIS) Q:REFL=""
 S CARD=$$CALIN^%QXPGES2(WHOIS("ETUDE"),"L0",LIS,"CARD",1)
 S ORD=$$PULLMAT2^%QXPPRI7(WHOIS("ETUDE"),WHOIS("NDCOUR"),"LISTE",REFL,IND) D SUPPMAT2^%QXPPRI7(WHOIS("ETUDE"),WHOIS("NDCOUR"),"LISTE.TRIEE",REFL,ORD),PA^%QXPGES2(WHOIS("ETUDE"),"L0",LIS,"CARD",CARD-1,1)
 Q
 
EXILIS(LIS) Q:LIS="" 0 Q:WHOIS("ETUDE")=0 $$EX^%QSGEST7(LIS)
 Q $$REFL^%QXPGESD(WHOIS("ETUDE"),LIS)'=""
EXILISE(LIS) Q:LIS="" 0 Q $$REFL^%QXPGESD(WHOIS("ETUDE"),LIS)'=""
 
ELIML(LIS) 
 Q:LIS=""
 N ADR,ADRT
 I WHOIS("ETUDE")'=0 G ELIMLEI
 S ADR=$$ADRLIS^%QSGEST7(LIS),ADRT=$$ADRLT^%QSGEST7(LIS)
 K @(ADR) D SX^%QSGESTK("L0",LIS)
 I ADRT'="" K @(ADRT)
 Q
 ;HL ELIML(LIS) 
 ;HL Q:LIS=""
 ;HL N ADR,ADRT
ELIMLEI D SX^%QXPGES2(WHOIS("ETUDE"),"L0",LIS)
 Q
 
 
CREERL(NOM,BASE,ADRESSE,NATSOURC,SOURC) 
 N REF
 I WHOIS("ETUDE")=0 D CREER^%QSGES11(BASE,NOM,BASE,0,NATSOURC,ADRESSE,SOURC) Q
 S REF=$$REFLC^%QXPGESD(WHOIS("ETUDE"),NOM)
 
 D PA2^%QXPGES2(WHOIS("ETUDE"),"L0",NOM,REF,"TRIABLE","NON",1)
 D PA2^%QXPGES2(WHOIS("ETUDE"),"L0",NOM,REF,"ADRESSE",ADRESSE,1)
 D PA2^%QXPGES2(WHOIS("ETUDE"),"L0",NOM,REF,"TYPE.OBJET","INDIVIDU",1)
 D PA2^%QXPGES2(WHOIS("ETUDE"),"L0",NOM,REF,"BASE",BASE,1)
 D PA2^%QXPGES2(WHOIS("ETUDE"),"L0",NOM,REF,"SOURCE",NATSOURC,1)
 D PA2^%QXPGES2(WHOIS("ETUDE"),"L0",NOM,REF,"CARD",0,1)
 D PA2^%QXPGES2(WHOIS("ETUDE"),"L0",NOM,REF,"AUTRE",SOURC,1)
 D PA2^%QXPGES2(WHOIS("ETUDE"),"L0",NOM,REF,"NOM",NOM,1)
 D PA2^%QXPGES2(WHOIS("ETUDE"),"L0",NOM,REF,"LOCALISATION",$I,1)
 D PA2^%QXPGES2(WHOIS("ETUDE"),"L0",NOM,REF,"AUTEUR",WHOIS,1)
 D PA2^%QXPGES2(WHOIS("ETUDE"),"L0",NOM,REF,"CREATION",$H,1)
 D PA2^%QXPGES2(WHOIS("ETUDE"),"L0",NOM,REF,"DATE.CREATION",$$DATENO^%QMDATE($P($H,",",1)),1)
 D PA2^%QXPGES2(WHOIS("ETUDE"),"L0",NOM,REF,"HEURE.CREATION",$$HEURNO^%QMDATE($P($H,",",2)),1)
 D PA2^%QXPGES2(WHOIS("ETUDE"),"L0",NOM,REF,"OBJET",$$NOMLOG^%QSF(BASE),1)
 
 Q
 
 
USE(LZLIG) 
 D PA^%QXPGES2(WHOIS("ETUDE"),"L0",LZLIG,"UTILISATION",$H,1)
 D PA^%QXPGES2(WHOIS("ETUDE"),"L0",LZLIG,"DATE.UTILISATION",$$DATENO^%QMDATE($P($H,",",1)),1)
 D PA^%QXPGES2(WHOIS("ETUDE"),"L0",LZLIG,"HEURE.UTILISATION",$$HEURNO^%QMDATE($P($H,",",2)),1)
 Q
 
 
SUIVL(LISTE,IND) 
 N G,I,%I,B,J,LS
 Q:LISTE="" ""
 I WHOIS("ETUDE")'=0 G SUIVLEI
 S B=$$BASE^%QSGEST7(LISTE) Q:B="" ""
 S LS=$$ADRLIS^%QSGEST7(LISTE) Q:LS="" ""
 S G=$$ADRLT^%QSGEST7(LISTE) G:G="" SUIVL2
 S J=""
 S I=$S(IND="":"",1:@LS@(IND)) F %I=0:0 S I=$O(@G@(I)) Q:I=""  S J=@G@(I) Q:$$IR^%QSGE5(B,J)
 Q J
SUIVL2 S I=IND F %I=0:0 S I=$O(@LS@(I)) Q:I=""  Q:$$IR^%QSGE5(B,I)
 Q I
 
 
 
SUIVLE(LISTE,IND) 
 N G,I,%I,B,J,LS
 Q:LISTE="" ""
SUIVLEI 
 S I=$$REFL^%QXPGESD(WHOIS("ETUDE"),LISTE) Q:I="" ""
 S G="",J=$S(IND="":"",1:$$PULLMAT2^%QXPPRI7(WHOIS("ETUDE"),WHOIS("NDCOUR"),"LISTE",I,IND))
 S J=$$SUIVMAT2^%QXPPRI7(WHOIS("ETUDE"),WHOIS("NDCOUR"),"LISTE.TRIEE",I,J,.G)
 Q $S(J="":"",1:G)
 ;
 ;
 ;

