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

;%QUBKVT^INT^1^59547,73884^0
%QUBKVT ;;04:15 PM  4 Feb 1992;
 
 
 
 N GL,LIS,z,nblig,MENUH
 S MENUH=$$TEMP^%SGUTIL
 S @MENUH="22^10^79"
 S @MENUH@(1)=$$^%QZCHW("principale")_"^PRINC",@MENUH@(1,"COM")=$$^%QZCHW("entrer dans la fenetre principale")
 S @MENUH@(2)=$$^%QZCHW("conditionnelle")_"^COND",@MENUH@(2,"COM")=$$^%QZCHW("entrer dans la fenetre conditionelle")
 S STOMAT=$$TEMP^%SGUTIL
 S GL=$$CONCAS^%QZCHAD(STOMAT,"GL")
 S LIS=$$CONCAS^%QZCHAD(STOMAT,"LIS")
 S @GL@("X")=0,@GL@("Y")=3,@GL@("L")=78,@GL@("H")=8,@GL@("TI")="Tableur"
 S @GL@("FEN",1,"L")=26,@GL@("FEN",1,"D")=1,@GL@("FEN",1,"F")=2
 S @GL@("FEN",2,"L")=8,@GL@("FEN",2,"D")=3,@GL@("FEN",2,"F")=4
 S @GL@("FEN",3,"L")=36,@GL@("FEN",3,"D")=5,@GL@("FEN",3,"F")=8
 F z=1:1:3 S @GL@("LI",z,"L")=12,@GL@("LI",z,"U")="OKMATH^%QUBKVT"
 F z=3,4 S @GL@("LI",z,"L")=8
 F z=5:1:8 S @GL@("LI",z,"L")=15,@GL@("LI",z,"U")="OKMATH^%QUBKVT"
 S @GL@("LI",1,"T")="operateur 1",@GL@("LI",3,"T")="induc",@GL@("LI",4,"T")="gag2"
 S @GL@("LI",2,"T")="operateur 2",@GL@("LI",5,"T")="addition",@GL@("LI",6,"T")="soustraction",@GL@("LI",7,"T")="multiplication",@GL@("LI",8,"T")="division"
 F nblig=1:1:20 S @LIS@(nblig)="^^^p^^^^^^^" D INIFC(nblig)
 S @GL@("SUPPLEM")="SUPPLEM^%QUBKVT"
 D CLEPAG^%VVIDEO
 S IDFSTR=$$^%QUBKVI(GL,LIS,STOMAT)
 D ^%QUBKVA(IDFSTR)
BCL S DX=0,DY=21 D CLEBAS^%VVIDEO,^%VQUIKMN(1,80,23,MENUH,.ADRES,.CONTR)
 G:CONTR="" @ADRES
 S LIGCOUR="" F %I=0:0 S LIGCOUR=$O(@STOMAT@("FCOND",LIGCOUR)) Q:LIGCOUR=""  S GL=@STOMAT@("FCOND",LIGCOUR,"GL") K @(GL)
 K @(MENUH),@(STOMAT),@(IDFSTR)
 Q
 
PRINC S RES=$$^%QUBKVR(IDFSTR)
 G BCL
 
COND S RES=$$^%QUBKVR(@STOMAT@("FCOND",@STOMAT@("LIGCOUR"),"NUMSTRU"))
 G BCL
 Q
 
OKMATH(GLOBA) 
 N V1,V2,GL,LIS
 S GL=$$CONCAS^%QZCHAD(GLOBA,"GL")
 S LIS=$$CONCAS^%QZCHAD(GLOBA,"LIS")
 I COLCOUR>3 S OK=0 Q
 I COLCOUR=3,$$NUM^%QZNBN(Y1) D EFFWIN S OK=1,REAF=0 Q
 I COLCOUR=2,$P(@LIS@(LIGCOUR),"^")="" S OK=0 Q
 I COLCOUR=1,LIGCOUR>1,$P(@LIS@(LIGCOUR-1),"^",2)="" S OK=0 Q
 I COLCOUR=1,$P(@LIS@(LIGCOUR),"^",2)="" S OK=1 Q
 S V1=$S(COLCOUR=1:Y1,1:$P(@LIS@(LIGCOUR),"^")),V2=$S(COLCOUR=1:$P(@LIS@(LIGCOUR),"^",2),1:Y1)
 S @LIS@(LIGCOUR)=V1_"^"_V2_"^"_$P(@LIS@(LIGCOUR),"^",3,4)_"^"_(V1+V2)_"^"_(V1-V2)_"^"_(V1*V2)_"^"_(V1/V2)
 S (OK,REAF)=1 Q
 
EFFWIN 
 N LL,LIS,GL
 S LL(1)=0,LL(2+(Y1#2))=75,LL(3-(Y1#2))=0
 D MODLG^%QUBKVA(@GLOBA@("FCOND",LIGCOUR,"NUMSTRU"),"LL")
 S GL=@GLOBA@("FCOND",LIGCOUR,"GL")
 S LIS=@GL@("A")
 S @LIS@(1)=$S(Y1#2:"^^^impaire^"_(Y1\2)_"^"_1_"^",1:"^paire^"_(Y1\2)_"^^^^")
 D ^%QUBKVA(@GLOBA@("FCOND",LIGCOUR,"NUMSTRU"))
 Q
 
SUPPLEM(GLOBA) 
 S @GLOBA@("LIGCOUR")=LIGCOUR
 D ^%QUBKVA(@GLOBA@("FCOND",LIGCOUR,"NUMSTRU"))
 Q
INIFEN2() 
 N GL,LIS
 S GL=$$TEMP^%SGUTIL
 S LIS=$$TEMP^%SGUTIL
 S @GL@("X")=0,@GL@("Y")=14,@GL@("L")=78,@GL@("H")=6,@GL@("TI")="Ligne"_LIGCOUR
 S @GL@("FEN",1,"L")=70,@GL@("FEN",1,"D")=1,@GL@("FEN",1,"F")=2
 F z=1:1:2 S @GL@("LI",z,"L")=30
 S @GL@("LI",1,"T")="texte",@GL@("LI",2,"T")="ligne"
 S @LIS@(1)="vous etes bien^sur la ligne "_LIGCOUR
 Q $$^%QUBKVI(GL,LIS,0)
 
 
INIFC(LIGCOUR) 
 N GL,LIS,z
 S GL=$$TEMP^%SGUTIL
 S LIS=$$TEMP^%SGUTIL
 S @GL@("X")=0,@GL@("Y")=14,@GL@("L")=78,@GL@("H")=6,@GL@("TI")="Ligne"_LIGCOUR
 S @GL@("FEN",1,"L")=75,@GL@("FEN",1,"D")=1,@GL@("FEN",1,"F")=1
 S @GL@("FEN",2,"L")=0,@GL@("FEN",2,"D")=2,@GL@("FEN",2,"F")=3
 S @GL@("FEN",3,"L")=0,@GL@("FEN",3,"D")=4,@GL@("FEN",3,"F")=6
 F z=1:1:6 S @GL@("LI",z,"L")=20
 S @GL@("LI",1,"T")="texte",@GL@("LI",2,"T")="type",@GL@("LI",3,"T")="diviseur",@GL@("LI",4,"T")="type",@GL@("LI",5,"T")="diviseur",@GL@("LI",6,"T")="reste"
 S @LIS@(1)="void^^^^^^^"
 S @GL@("A")=LIS
 S @STOMAT@("FCOND",LIGCOUR,"NUMSTRU")=$$^%QUBKVI(GL,LIS,0)
 S @STOMAT@("FCOND",LIGCOUR,"GL")=GL
 Q
 ;
 ;

