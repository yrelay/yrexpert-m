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

;%QS0^INT^1^59547,73879^0
%QS0 ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
COMPL 
 I '($D(^[QUI]ZLIGVERS(11E-1))) S ^[QUI]ZLIGVERS(11E-1)="" D V1
 I '($D(^[QUI]ZLIGVERS(12E-1))) S ^[QUI]ZLIGVERS(12E-1)="" D V2
 Q
V1 D POCLEPA^%VVIDEO W "Initialisation Version Listes 1.1, un instant ..." H 1
 N B,D1,D2,I,%I
 S I="" F %I=0:0 S I=$$NXTRI^%QSTRUC8("L0",I) Q:I=""  D POCLEPA^%VVIDEO W I S D1=$$^%QSCALIN("L0",I,"CREATION",1),D2=$$^%QSCALIN("L0",I,"UTILISATION",1) D TTT
 Q
TTT S:D1="" D1=$H S:D2="" D2=$H D PA^%QSGESTI("L0",I,"DATE.CREATION",$$DATENO^%QMDATE($P(D1,",",1)),1),PA^%QSGESTI("L0",I,"HEURE.CREATION",$$HEURNO^%QMDATE($P(D1,",",2)),1),PA^%QSGESTI("L0",I,"DATE.UTILISATION",$$DATENO^%QMDATE($P(D2,",",1)),1)
 D PA^%QSGESTI("L0",I,"HEURE.UTILISATION",$$HEURNO^%QMDATE($P(D2,",",2)),1)
 S B=$$^%QSCALIN("L0",I,"BASE",1) Q:B=""
 D PA^%QSGESTI("L0",I,"OBJET",$$NOMLOG^%QSF(B),1)
 Q
 
V2 D POCLEPA^%VVIDEO W "Initialisation Version Listes 1.2, un instant ..." H 1
 N I,%I,R
 S I="" F %I=0:0 S I=$$NXTRI^%QSTRUC8("L0",I) Q:I=""  S R=$$^%QSCALVA("L0",I,"REQUETE") I R'="" D POCLEPA^%VVIDEO W I D PS^%QSGESTI("L0",I,"REQUETE",R,1),PA^%QSGESTI("L0",I,"AUTRE",R,1)
 Q
 
USE(LZLIG) 
 D PA^%QSGESTI("L0",LZLIG,"UTILISATION",$H,1),PA^%QSGESTI("L0",LZLIG,"DATE.UTILISATION",$$DATENO^%QMDATE($P($H,",",1)),1),PA^%QSGESTI("L0",LZLIG,"HEURE.UTILISATION",$$HEURNO^%QMDATE($P($H,",",2)),1)
 Q
 
ADD(LZLIG,IZLIG) 
 N A,%A,O,%O,B
 S A=-1 F %A=0:0 S A=$N(@IZLIG@(A)) Q:A=-1  S O=-1 F %O=0:0 S O=$N(@IZLIG@(A,O)) Q:O=-1  D PA^%QSGESTI("L0",LZLIG,A,@IZLIG@(A,O),O)
 D PA^%QSGESTI("L0",LZLIG,"NOM",LZLIG,1)
 D PA^%QSGESTI("L0",LZLIG,"LOCALISATION",$I,1)
 D PA^%QSGESTI("L0",LZLIG,"AUTEUR",WHOIS,1)
 D PA^%QSGESTI("L0",LZLIG,"CREATION",$H,1)
 D PA^%QSGESTI("L0",LZLIG,"DATE.CREATION",$$DATENO^%QMDATE($P($H,",",1)),1)
 D PA^%QSGESTI("L0",LZLIG,"HEURE.CREATION",$$HEURNO^%QMDATE($P($H,",",2)),1)
 D USE(LZLIG)
 Q:'($D(@IZLIG@("BASE",1)))
 S B=@IZLIG@("BASE",1)
 D PA^%QSGESTI("L0",LZLIG,"OBJET",$$NOMLOG^%QSF(B),1) Q
 
DEL(LZLIG) 
 I '($$EX^%QSGEST7(LZLIG)) Q
 N A S A=$$^%QSCALVA("L0",LZLIG,"ADRESSE")
 I A'="" S:(A["^[QUI]RQS2(")_LZLIG A="^[QUI]RQS2("""_LZLIG_""")" K @(A)
 S A=$$^%QSCALVA("L0",LZLIG,"TRIEE")
 K:A'="" @(A)
 D SX^%QSGESTK("L0",LZLIG)
 Q
 
EX(LZLIG) 
 Q:LZLIG="" 0 Q $$IR^%QSGE5("L0",LZLIG)
 
ADDA(LZLIG,AZLIG,VZLIG) 
 D PA^%QSGESTI("L0",LZLIG,AZLIG,VZLIG,1) Q
 
INIT D KILL^%QSGEST2("L0")
 K ^[QUI]RQS3("L0")
 Q
 
CH(GLIG) 
 
 N FENETRE,LISTE
 S FENETRE("X")=0,FENETRE("Y")=3,FENETRE("L")=80,FENETRE("H")=20,FENETRE("A")=$$LISTIND^%QSGEST6("L0"),FENETRE("B")="L0"
 D IFEN^%QS0D(.FENETRE),CLEPAG^%VVIDEO
 S DXG=0,DXD=39,DYH=0,DYB=2,GRAPH=1,MSG="LISTES POSSIBLES" D 4^%VZCD,INIT^%QUAPAGM("FENETRE"),AFFICH^%QUAPAGM
 S LISTE=$$UN^%QUAPAGM Q LISTE
 
CHOBJ(LTL) 
 
 
 N ABEND,ADRES,DX,DY,I,%I,LIST,N,O,%O K ^L($J)
 D POCLEPA^%VVIDEO W "Un instant ..."
 S LIST=$$CH(LTL) Q:LIST="" ""
 S ADRES=$$^%QSCALVA("L0",LIST,"ADRESSE")
 D POCLEPA^%VVIDEO W "Un instant ..."
 D 2^%QUCHOYN(ADRES,"^L($J)",LIST,"DESELECTION") Q:ABEND ""
 D POCLEPA^%VVIDEO W "Un instant ..."
 S N=0,I=-1 F %I=0:0 S I=$N(^L($J,I)) Q:I=-1  S N=N+1 K:'(^L($J,I)) ^L($J,I) W:(N#100)=0 "%"
 Q "^L($J)"

