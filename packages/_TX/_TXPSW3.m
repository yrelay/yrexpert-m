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

;%TXPSW3^INT^1^59547,74033^0
%TXPSW3 ;;11:34 AM  3 May 1993; ; 03 May 93  3:11 PM
 
 
 
CONTATT N GLOB,GLODEFA
 S GLOB=etuatc
 S GLODEFA=$$TEMP^%SGUTIL
 S TITRE="Description de la Contrainte"
 
 S NBC=10,NBFIXH=3,NBFIXB=1
 
 S @GLODEFA@("FIXH",1,"LIB")="Etude"
 S @GLODEFA@("FIXH",1,"ROUCAL")="$$etude^%TXPSW3"
 S @GLODEFA@("FIXH",2,"LIB")="Atelier"
 S @GLODEFA@("FIXH",2,"ROUCAL")="$$atelier^%TXPSW3"
 S @GLODEFA@("FIXH",3,"LIB")="Contrainte"
 S @GLODEFA@("FIXH",3,"ROUCAL")="$$contr^%TXPSW3"
 S @GLODEFA@("FIXB",1,"LIB")="Valeur globale"
 S @GLODEFA@("FIXB",1,"ROUCAL")="$$vglbcat^%TXPSW3"
 S @GLODEFA@("FIXB",2,"LIB")="Etat de cette contrainte"
 S @GLODEFA@("FIXB",2,"ROUCAL")="$$etctcat^%TXPSW3"
 
 S @GLODEFA@("ROULIB")="$$libcat^%TXPSW3"
 S @GLODEFA@("ROUDEF")="$$vdefcat^%TXPSW3"
 S @GLODEFA@("ROUAFF")="$$libcat^%TXPSW3"
 D SAISVAL^%TXPSUT2(GLOB,GLODEFA,TITRE,NBC,NBFIXH,NBFIXB,4)
 K @(GLODEFA)
 Q
 
etude() Q ETUDE
atelier() Q ATELIER
article() Q ARTICLE
contr() Q CONTRAINTE
 
vglbcat() Q "000"
 
etctcat() Q "Non Active"
 
libcat(i) Q:i=1 "Commentaire" Q:i=2 "Unite de Calcul" Q:i=3 "Valeur Standard" Q:i=4 "Etat de cette contrainte"
vdefcat(i) Q:i=1 "contrainte de capacite" Q:i=2 "Nombre d'Heures" Q:i=3 "100000" Q:i=4 "Non Active"
 
 
 
 
DEMART N GLOB,GLODEFA,NBC,NBFIXH,NBFIXB
 N PERDP S PERDP=$$PERDP
 S GLOB="^[QUI]etu(ETUDE,""AT"",ATELIER,""AR"",ARTICLE,""DMD"",""DEMANDE"")"
 S @GLOB@("Valeur Standard")=0
 S GLODEFA=$$TEMP^%SGUTIL
 S TITRE=" demandes : semaines "_^[QUI]semaine(1+PERDP)_" a "_^[QUI]semaine(PMAX+PERDP)
 
 S NBC=10,NBFIXH=3,NBFIXB=0
 
 
 S @GLODEFA@("FIXH",1,"LIB")="Etude"
 S @GLODEFA@("FIXH",1,"ROUCAL")="$$etude^%TXPSW3"
 S @GLODEFA@("FIXH",2,"LIB")="Atelier"
 S @GLODEFA@("FIXH",2,"ROUCAL")="$$atelier^%TXPSW3"
 S @GLODEFA@("FIXH",3,"LIB")="Article"
 S @GLODEFA@("FIXH",3,"ROUCAL")="$$article^%TXPSW3"
 
 S @GLODEFA@("ROULIB")="$$vstodar^%TXPSW3"
 S @GLODEFA@("ROUDEF")="$$vdefdar^%TXPSW3"
 S @GLODEFA@("ROUAFF")="$$vaffdar^%TXPSW3"
 D SAISVAL^%TXPSUT2(GLOB,GLODEFA,TITRE,NBC,NBFIXH,NBFIXB,PMAX)
 
 
 Q
 
 
vstodar(i) S VAR(i)="Periode "_i Q "Periode "_i
vdefdar(I) N V
 I I=1 S V=@GSUIV@("Valeur Standard") Q V
 I $D(VAR(I-1)),$D(@GSUIV@(VAR(I-1))) S V=@GSUIV@(VAR(I-1)) Q V
 S V=@GSUIV@("Valeur Standard") Q V
 
vaffdar(i) Q "Semaine "_^[QUI]semaine(i+PERDP)
 
 
 
 
INIDEM(GSUIV) 
 N I,V1
 F I=1:1:PMAX S V1=$$vstodar(I) I '($D(@GSUIV@(V1))) S @GSUIV@(V1)=$$vdefdar(I)
 I '($D(@GSUIV@("Etude"))) S @GSUIV@("Etude")=$$etude
 I '($D(@GSUIV@("Atelier"))) S @GSUIV@("Atelier")=$$atelier
 I '($D(@GSUIV@("Article"))) S @GSUIV@("Article")=$$article
 Q
 
 
 
CONTPER 
 N GLOB,GLODEFA,NBC,NBFIXH,NBFIXB
 N PERDP S PERDP=$$PERDP
 S GLOB=etuatc
 S GLODEFA=$$TEMP^%SGUTIL
 S TITRE=" capacite maximum : semaines "_^[QUI]semaine(1+PERDP)_" a "_^[QUI]semaine(PMAX+PERDP)
 
 S NBC=10,NBFIXH=3,NBFIXB=0
 
 S @GLODEFA@("FIXH",1,"LIB")="Etude"
 S @GLODEFA@("FIXH",1,"ROUCAL")="$$etude^%TXPSW3"
 S @GLODEFA@("FIXH",2,"LIB")="Atelier"
 S @GLODEFA@("FIXH",2,"ROUCAL")="$$atelier^%TXPSW3"
 S @GLODEFA@("FIXH",3,"LIB")="Contrainte"
 S @GLODEFA@("FIXH",3,"ROUCAL")="$$contr^%TXPSW3"
 
 S @GLODEFA@("ROULIB")="$$vstoctr^%TXPSW3"
 S @GLODEFA@("ROUDEF")="$$vdefctr^%TXPSW3"
 S @GLODEFA@("ROUAFF")="$$vaffdar^%TXPSW3"
 D SAISVAL^%TXPSUT2(GLOB,GLODEFA,TITRE,NBC,NBFIXH,NBFIXB,PMAX)
 Q
 
 
vstoctr(i) Q "Periode "_i
vdefctr(I) N V
 I I=1 S V=@GSUIV@("Valeur Standard") Q V
 I $D(VAR(I-1)),$D(@GSUIV@(VAR(I-1))) S V=@GSUIV@(VAR(I-1)) Q V
 S V=@GSUIV@("Valeur Standard") Q V
 
 
 
INICONT(GSUIV) 
 N I,V1
 F I=1:1:PMAX S V1=$$vstoctr(I) I '($D(@GSUIV@(V1))) S @GSUIV@(V1)=$$vdefctr(I)
 I '($D(@GSUIV@("Etude"))) S @GSUIV@("Etude")=$$etude
 I '($D(@GSUIV@("Atelier"))) S @GSUIV@("Atelier")=$$atelier
 I '($D(@GSUIV@("Contrainte"))) S @GSUIV@("Etude")=$$contr
 Q
 
SOLART N GLOB,GLODEFA,NBC,NBFIXH,NBFIXB
 N PERDP S PERDP=$$PERDP
 S GLOB=SOL
 S @GLOB@("Stock Initial")=$S($D(@etuata@("Stock Initial")):@etuata@("Stock Initial"),1:0)
 S GLODEFA=$$TEMP^%SGUTIL
 S TITRE=" solution : semaines "_^[QUI]semaine(1+PERDP)_" a "_^[QUI]semaine(PMAX+PERDP)
 
 S NBC=10,NBFIXH=5,NBFIXB=0
 
 S @GLODEFA@("FIXH",1,"LIB")="Etude"
 S @GLODEFA@("FIXH",1,"ROUCAL")="$$etude^%TXPSW3"
 S @GLODEFA@("FIXH",2,"LIB")="Atelier"
 S @GLODEFA@("FIXH",2,"ROUCAL")="$$atelier^%TXPSW3"
 S @GLODEFA@("FIXH",3,"LIB")="Article"
 S @GLODEFA@("FIXH",3,"ROUCAL")="$$article^%TXPSW3"
 S @GLODEFA@("FIXH",4,"LIB")="Valeur de Jauge"
 S @GLODEFA@("FIXH",4,"ROUCAL")="$$valsol^%TXPSW3"
 S @GLODEFA@("FIXH",5,"LIB")="Stock Initial"
 S @GLODEFA@("FIXH",5,"ROUCAL")="$$stosol^%TXPSW3"
 
 S @GLODEFA@("ROULIB")="$$vstodar^%TXPSW3"
 S @GLODEFA@("ROUDEF")="$$vdefsol^%TXPSW3"
 S @GLODEFA@("ROUAFF")="$$vaffdar^%TXPSW3"
 D SAISVAL^%TXPSUT2(GLOB,GLODEFA,TITRE,NBC,NBFIXH,NBFIXB,PMAX)
 Q
 
 
vdefsol(I) N V
 Q @SOL@("Periode "_I)
 
valsol() 
 Q @etuata@("Valeur Jauge")\1
stosol() 
 Q $S($D(@etuata@("Stock Initial")):@etuata@("Stock Initial"),1:0)
 I $D(@SOL@("NIVEAU.INITIAL")) Q @SOL@("NIVEAU.INITIAL")
 Q 0
 
PERDP() 
 N %DS,%DN,s,sem,PERDP
 S %DS=$$PERM^%QMDATE(@etu@("Date de Depart")) D INT^%QMDAUT2
 I '($D(^[QUI]switchsem)) D totale^%TXPGSEM(%DN) S ^[QUI]switchsem=$H
 D gooday^%TXPGSEM(%DN) S s=sem
 Q ^[QUI]periode(s)
 ;

